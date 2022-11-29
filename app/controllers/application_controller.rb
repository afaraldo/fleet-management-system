# Main class controller
class ApplicationController < ActionController::Base
  include ControllerResources
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  add_breadcrumb 'Inicio', :root_path # Use for breadcrumbs_on_rails gem
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  # GET
  def index
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session["/#{plural_resource_name}"], only_path: true) # Use for breadcrumbs_on_rails gem
    resource_search_method = :ransack
    @ransack = model_class.send(resource_search_method, search_params)
    @q = @ransack.result.page(pagination_params[:page]).per(pagination_params[:per])
    instance_variable_set :@result, @q.includes(included_associations)
    instance_variable_set "@#{plural_resource_name}", @result
    save_last_params
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
    flash[:success] = I18n.t('created', record: record)
    respond_to do |format|
      format.html { redirect_to action: :edit, id: record.id }
    end
  end

  # POST
  def update
    model.send(:update!, model_params)
    record = instance_variable_set "@#{resource_name}", model
    flash[:success] = I18n.t('updated', record: record)
    respond_to do |format|
      format.html { redirect_to action: :edit, id: record.id }
    end
  end

  # DELETE
  def destroy
    record = instance_variable_set "@#{resource_name}", model
    model.send(:destroy!)

    flash[:success] = I18n.t('destroyed', record: record)
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

  private

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
    session[controller_name] = params.permit
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
    params.require(model_class.name.underscore.to_sym).permit(_params)
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
end
