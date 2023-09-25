# frozen_string_literal: true

# table
class MaintenanceTableComponent < ViewComponent::Base
  include SimpleFormRansackHelper
  def initialize(maintenances:, ransack:)
    super
    @maintenances = maintenances
    @ransack = ransack
  end

end
