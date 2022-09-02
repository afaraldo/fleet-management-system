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

  private

  # Override this method to provide your own search params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the search
  # method.
  def search_params
    params.permit!.extract!(:q)
  end

  # Override this method to provide your own search params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the search
  # method.
  def pagination_params
    params.permit(:page, :per).extract!(:page, :per)
  end
end
