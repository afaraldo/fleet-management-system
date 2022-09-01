# Main class controller
class ApplicationController < ActionController::Base
  include ControllerResources
  add_breadcrumb 'home', :root_path

  protected

  # Find the collection by its search params.
  #
  # @protected
  # @return [Object]
  def collection
    resource_search_method = :ransack
    model_class.send(resource_search_method, search_params[:q])
               .result
               .page(pagination_params[:page])
               .per(pagination_params[:per])
  end
end
