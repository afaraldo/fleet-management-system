# frozen_string_literal: true

# table
class InsurancePlanTableComponent < ViewComponent::Base
  def initialize(insurance_plans:, ransack:)
    super
    @insurance_plans = insurance_plans
    @ransack = ransack
  end

end
