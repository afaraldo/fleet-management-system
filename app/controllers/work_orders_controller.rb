# Controller for WorkOrder
class WorkOrdersController < ApplicationController
  resource :work_order

  def new
    # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true)
    add_breadcrumb I18n.t('buttons.new'), nil # Use for breadcrumbs_on_rails gem
    @model = model_class.send(:new)
    instance_variable_set "@#{resource_name}", @model

    # Add extra variables
    @last_number = (WorkOrder.last.try(:number) || 0) + 1
    @cars = Car.all.page(0)
  end

  def create
    record = instance_variable_set "@#{resource_name}", model_class.send(:create!, model_params)
    flash[:success] = I18n.t('created', record:, class: I18n.t("activerecord.models.#{record.class.name.underscore.parameterize}.one"))
    respond_to do |format|
      format.html { redirect_to action: :edit, id: record.id }
    end
  end

  def update
    model.send(:update!, model_params)
    record = instance_variable_set "@#{resource_name}", model
    flash[:success] = I18n.t('updated', record:, class: I18n.t("activerecord.models.#{record.class.name.underscore.parameterize}.one"))
    respond_to do |format|
      format.html { redirect_to action: :edit, id: record.id }
    end
  end

  def collection; end

  def included_associations
    %i[car employee]
  end
end
