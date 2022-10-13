# Controller for WorkOrder
class WorkOrdersController < ApplicationController
  resource :work_order

  def new
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('buttons.new'), nil # Use for breadcrumbs_on_rails gem
    instance_variable_set "@#{resource_name}", model_class.send(:new)

    # Add extra variables
    @last_number = WorkOrder.last.try(:number) || 1
  end
end
