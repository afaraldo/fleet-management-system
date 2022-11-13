# Controller for Cars model
class CarsController < ApplicationController
  resource :car

  def show
    find_resource
    context = GetCarEvents.call(id: params[:id],
                                start_date: params[:start_date],
                                final_date: params[:final_date])
    @events = []
    if context.success?
      @events = context.result
    else
      Rails.logger.debug { "Error when importing users :: #{context.error}" }
    end
  end
end
