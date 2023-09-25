# Controller for Cars model
class CarsController < ApplicationController
  resource :car

  def show
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb @car.plate_number, nil # Use for breadcrumbs_on_rails gem
    find_resource
    @work_orders = @car.work_orders
  end
end
