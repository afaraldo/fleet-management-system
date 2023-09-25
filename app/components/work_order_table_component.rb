# frozen_string_literal: true

# Table
class WorkOrderTableComponent < ViewComponent::Base
  include SimpleFormRansackHelper
  def initialize(work_orders:, ransack:)
    super
    @work_orders = work_orders
    @ransack = ransack
  end

end
