# frozen_string_literal: true
# component
class WorkOrdersWidgetComponent < ViewComponent::Base
  def initialize(data:)
    super
    @work_orders = data
  end

  def quantity
    @work_orders.size
  end
end
