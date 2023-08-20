# Controller for Maintenance model
class MaintenancesController < ApplicationController
  resource :maintenance

  def included_associations
    %i[car mechanical_workshop]
  end
end
