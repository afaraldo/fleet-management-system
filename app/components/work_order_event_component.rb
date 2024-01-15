# frozen_string_literal: true

class WorkOrderEventComponent < ViewComponent::Base
  def initialize(work_order:)
    @work_order = work_order
  end

end
