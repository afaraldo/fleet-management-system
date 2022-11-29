# Controller for Cars model
class CarsController < ApplicationController
  resource :car

  def show
    add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('buttons.show'), nil # Use for breadcrumbs_on_rails gem
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
