require 'query_report/helper'  # need to require the helper

# This class is a example of report controller
class WorkOrderReportsController < ApplicationController
  include QueryReport::Helper # need to include it

  def index
    add_breadcrumb I18n.t('navbar.report'), nil # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), nil

    @work_orders = WorkOrder
                   .includes(:car)
                   .joins(:car)
                   .where(status: :finished)
                   .order('cars.plate_number ASC')

    reporter(@work_orders) do
      filter :number, type: :text
      filter :start_date, type: :date, default: [5.months.ago, 1.month.from_now]
      filter :final_date, type: :date, default: [5.months.ago, 1.month.from_now]

      column :finished_on do |work_order|
        datetime_format(work_order.finished_on)
      end
      column :number do |work_order|
        link_to work_order.number, edit_work_order_path(work_order)
      end
      column :car
      column :description
      column :city
      column :distance, show_total: true, &:distance
      column :start_mileage
      column :final_mileage
      column :workdays, show_total: true, &:workdays
      column :final_oil, show_total: true
      column :employee do |work_order|
        work_order.employee.to_s
      end
    end
  end

  def resource_name
    'work_order'
  end

  def params
    request.params
  end
end
