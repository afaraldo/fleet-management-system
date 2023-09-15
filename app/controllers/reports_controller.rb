# Reports Controller
class ReportsController < ApplicationController
  def work_orders
    from = params[:from] ? Date.parse(report_params[:from]) : Date.current.beginning_of_month
    to = params[:to] ? Date.parse(report_params[:to]) : Date.current.end_of_month

    work_orders = WorkOrder.where(created_at: from..to)

    @data = work_orders.group_by_week(:created_at).count

    render json: {
      series: @data.values,
      categories: @data.keys.map { |date| date.strftime('%Y-%m-%d') }
    }
  end

  def report_params
    params.permit(:from, :to)
  end
end
