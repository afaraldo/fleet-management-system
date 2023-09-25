# Controller for Cars model
class CarsController < ApplicationController
  resource :car

  def show
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb @car.plate_number, nil # Use for breadcrumbs_on_rails gem
    find_resource
    params ||= {}
    params[:q] ||= {}
    params[:q][:car_id_eq] = @car.id

    @ransack = WorkOrder.ransack(params[:q])
    @work_orders = @ransack.result.page(params[:page]).per(params[:per])

    @ransack_insurance = InsurancePlan.ransack(params[:q])
    @insurance_plans = @ransack_insurance.result.page(params[:page]).per(params[:per])

    @ransack_maintenances = Maintenance.ransack(params[:q])
    @maintenances = @ransack_maintenances.result.page(params[:page]).per(params[:per])
  end
end
