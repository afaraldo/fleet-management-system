# Controller for Repairs model
class RepairsController < ApplicationController
  resource :repair

  def included_associations
    %i[car mechanical_workshop]
  end

end
