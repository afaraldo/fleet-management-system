# Controller class to Dashboard
class DashBoardsController < ApplicationController
  def index
    @work_orders = WorkOrder.all

    start_date_this_month = Date.today.beginning_of_month
    end_date_this_month = Date.today.end_of_month
    start_date_last_month = 1.month.ago.beginning_of_month
    end_date_last_month = 1.month.ago.end_of_month

    # Consulta la base de datos para obtener el número de work_orders autorizadas este mes y el mes pasado
    @authorized_work_orders_count_this_month = WorkOrder.where(
      start_date: start_date_this_month..end_date_this_month,
      status: 1
    ).count

    @authorized_work_orders_count_last_month = WorkOrder.where(
      start_date: start_date_last_month..end_date_last_month,
      status: 1
    ).count

    # Asegúrate de que la cantidad del mes pasado no sea cero para evitar la división por cero
    return unless @authorized_work_orders_count_last_month != 0

    @percentage_difference = (
      (@authorized_work_orders_count_this_month - @authorized_work_orders_count_last_month).to_f /
        @authorized_work_orders_count_last_month
    ) * 100

    # Define el primer y último día del mes actual y del mes anterior
    first_day_this_month = Date.today.beginning_of_month
    last_day_this_month = Date.today.end_of_month
    first_day_last_month = (Date.today - 1.month).beginning_of_month
    last_day_last_month = (Date.today - 1.month).end_of_month

    # Obtén todas las órdenes de trabajo del mes actual y del mes anterior
    work_orders_this_month = WorkOrder.where(start_date: first_day_this_month..last_day_this_month)
    work_orders_last_month = WorkOrder.where(start_date: first_day_last_month..last_day_last_month)

    # Agrupa las órdenes de trabajo por vehículo y calcula la duración total de las órdenes de trabajo para cada vehículo
    utilization_this_month = work_orders_this_month.group_by(&:car_id).transform_values do |orders|
      orders.sum { |order| order.final_date - order.start_date }
    end
    utilization_last_month = work_orders_last_month.group_by(&:car_id).transform_values do |orders|
      orders.sum { |order| order.final_date - order.start_date }
    end

    # Calcula el promedio de utilización para cada mes
    average_utilization_this_month = utilization_this_month.values.sum / utilization_this_month.keys.count unless utilization_this_month.empty?
    average_utilization_last_month = utilization_last_month.values.sum / utilization_last_month.keys.count unless utilization_last_month.empty?

    # O puedes poner 0 si no hay datos
    @average_utilization_this_month ||= 0
    @average_utilization_last_month ||= 0

    if @average_utilization_last_month.zero?
      # Si el denominador es 0, maneja este caso como lo consideres necesario.
      # Por ejemplo, podrías considerar una diferencia del 100% si el promedio de este mes es positivo,
      # o una diferencia del 0% si ambos promedios son 0.
      @percentage_difference_avg = @average_utilization_this_month.positive? ? 100 : 0
    else
      @percentage_difference = ((@average_utilization_this_month - @average_utilization_last_month) / @average_utilization_last_month.to_f) * 100
    end
  end
end
