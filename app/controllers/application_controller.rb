# Main class controller
class ApplicationController < ActionController::Base
  include ControllerResources

  # GET
  def index
    resource_search_method = :ransack
    instance_variable_set :@q, model_class.send(resource_search_method)
    instance_variable_set "@#{resource_name}", @q.result
                                                 .page(pagination_params[:page])
                                                 .per(pagination_params[:per])
  end
  
  # GET
  def new
    instance_variable_set "@#{resource_name}", model_class.send(:new)
  end

  # POST
  def create
    instance_variable_set "@#{resource_name}", model_class.send(:create, model_params)
    render :edit
  end

  # POST
  def update
    instance_variable_set "@#{resource_name}", model_class.send(:update, model_params)
    render :edit
  end

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

  # Runs before every action to determine its resource in an instance
  # variable.
  #
  # @protected
  def find_resource
    if collection?
      instance_variable_set "@#{plural_resource_name}", collection
    else
      instance_variable_set "@#{resource_name}", model
    end
  end

  private

  # Override this method to provide your own search params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the search
  # method.
  def search_params
    params.permit(q: {}).extract!(:q)
  end

  # Override this method to provide your own search params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the search
  # method.
  def pagination_params
    params.permit(:page, :per).extract!(:page, :per)
  end

  # Override this method to provide your own model params.
  #
  # @private
  # @return [ActionController::Parameters] Params given to the create
  # method.
  def model_params
    params.require(model_class.name.underscore.to_sym).permit(model_class.attribute_names)
  end
end
