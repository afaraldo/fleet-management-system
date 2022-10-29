# Controller for WorkOrder
class WorkOrdersController < ApplicationController
  resource :work_order

  def new
    # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true)
    add_breadcrumb I18n.t('buttons.new'), nil # Use for breadcrumbs_on_rails gem
    @model = model_class.send(:new)
    @model.status = 0
    instance_variable_set "@#{resource_name}", @model

    # Add extra variables
    @last_number = WorkOrder.last.try(:number) || 1
    @cars = Car.all.page(0)
  end
end
