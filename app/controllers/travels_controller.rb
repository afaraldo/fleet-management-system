# Controller
class TravelsController < ApplicationController
  resource :work_order

  def index
    employee = current_user.employee
    @work_orders = WorkOrder.where(employee: employee)
                            .where("status = ? OR status = ?", WorkOrder.statuses[:authorized], WorkOrder.statuses[:accepted])
                            .last(10)
  end

  def update
    work_order = current_user.employee.work_orders.find(travel_params[:id])
    work_order.accepted!

    redirect_to travels_index_path
  end

  def travel_params
    params.require(:work_order).permit(:id)
  end
end
