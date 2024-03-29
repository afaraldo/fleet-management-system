# Main class controller
class ApplicationController < ActionController::Base
  include ControllerResources
  set_current_tenant_through_filter # Required to opt into this behavior

  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_organization_as_tenant
  before_action :set_sentry_context
  before_action :configure_permitted_parameters, if: :devise_controller?

  # unless Rails.application.config.consider_all_requests_local
  #   rescue_from Exception, with: :render500
  #   rescue_from ActiveRecord::RecordNotFound, with: :render404
  #   rescue_from ActionController::RoutingError, with: :render404
  # end

  def set_organization_as_tenant
    return if current_user.blank?

    organization = current_user.organization
    set_current_tenant(organization)
  end

  def set_sentry_context
    Rails.logger.debug { "User: #{current_user&.inspect}" }
    Sentry.set_user(id: current_user.id, email: current_user.email) if current_user
    Sentry.set_extras(params: params.to_unsafe_h, url: request.url)
  end

  add_breadcrumb 'Inicio', :root_path # Use for breadcrumbs_on_rails gem
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  # GET
  def index
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session["/#{plural_resource_name}"], only_path: true) # Use for breadcrumbs_on_rails gem
    resource_search_method = :ransack
    @ransack = model_class.send(resource_search_method, search_params)
    @q = @ransack.result.page(pagination_params[:page]).per(pagination_params[:per])
    instance_variable_set :@result, @q.includes(included_associations)
    instance_variable_set "@#{plural_resource_name}", @result
    respond_to do |format|
      format.html do
        save_last_params
      end
      format.json
      format.xlsx do
        filename = "#{model_class.model_name.human}_#{Time.zone.now}"
        response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}.xlsx\""
      end
    end
  end

  # GET /cars/{id}
  def show
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('buttons.edit'), nil # Use for breadcrumbs_on_rails gem
  end

  # GET
  def new
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('buttons.new'), nil # Use for breadcrumbs_on_rails gem
    instance_variable_set "@#{resource_name}", model_class.send(:new)
  end

  # GET
  def edit
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('buttons.edit'), nil # Use for breadcrumbs_on_rails gem
  end

  # POST
  def create
    record = instance_variable_set "@#{resource_name}", model_class.send(:create!, model_params)
    flash[:success] = I18n.t('created', record:, class: I18n.t("activerecord.models.#{record.class.name.downcase}.one"))
    respond_to do |format|
      format.html { redirect_to action: :edit, id: record.id }
    end
  end

  # POST
  def update
    model.send(:update!, model_params)
    record = instance_variable_set "@#{resource_name}", model
    flash[:success] = I18n.t('updated', record:, class: I18n.t("activerecord.models.#{record.class.name.underscore.parameterize}.one"))
    respond_to do |format|
      format.html { redirect_to action: :edit, id: record.id }
    end
  end

  # DELETE
  def destroy
    record = instance_variable_set "@#{resource_name}", model
    model.send(:destroy!)

    flash[:success] = I18n.t('destroyed', record:, class: I18n.t("activerecord.models.#{record.class.name.downcase}.one"))
    redirect_to :"#{plural_resource_name}"
  end

  protected

  # Find the collection by its search params.
  #
  # @protected
  # @return [Object]
  def collection; end

  # Runs before every action to determine its resource in an instance
  # variable.
  #
  # @protected
  def find_resource
    if collection?
      instance_variable_set "@#{plural_resource_name}", collection
    else
      instance_variable_set "@#{resource_name}", model
    end
  end

  def blazer_authentication
    # depending on your auth, something like...
    redirect_to root_path unless current_user # &.admin?
  end

  private

  def after_sign_in_path_for(_resource)
    case current_user.role
    when 'driver'
      travels_index_path
    else # :superadmin, :admin, :secretary
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path(org: MultiTenant.current_tenant.name)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[org organization_id])
  end

  # Override this method to provide your own search params.
  # Also it save filters in params[:q] in cookies.
  # This allow remember last action in index views
  #
  # @private
  # @return [ActionController::Parameters] Params given to the search
  # method.
  def search_params
    params[:q]
  end

  # @private
  # @return [ActionController::Parameters] Params given to the search
  # Save the last params in cookies
  def save_last_params
    session[controller_name] = params.permit!
    session[controller_name]
  end

  # Override this method to provide your own search params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the search
  # method.
  def pagination_params
    params.permit(:page, :per).extract!(:page, :per)
  end

  # Override this method to provide your own model params.
  #
  # @private
  # @return [:symbol, symbol: [:symbol]] Array with include format
  def included_associations; end

  # Override this method to provide your own model params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the create
  # method.
  def model_params
    params.require(model_class.name.underscore.to_sym).permit(model_class.name.underscore.to_sym)
  end

  def _params
    model_class.attribute_names + model_class.reflect_on_all_associations.map(&:name) + extra_params
  end

  # Used to add more attributes for example car_ids
  def extra_params
    []
  end

  def record_invalid(exception)
    instance_variable_set "@#{resource_name}", exception.record

    respond_to do |format|
      flash.turbo[:danger] = exception.message.to_s
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: exception.record.errors, status: :unprocessable_entity }
    end
  end

  def render404(exception)
    Rails.logger.debug exception.full_message
    notify_sentry(exception)
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def render500(exception)
    Rails.logger.debug exception.full_message
    notify_sentry(exception)
    render file: Rails.public_path.join('500.html'), status: :internal_server_error, layout: false
  end

  def notify_sentry(exception)
    Rails.logger.debug exception.full_message
    Sentry.capture_exception(exception)
  end
end
