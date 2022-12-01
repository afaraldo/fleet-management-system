# Controller for Suppliers model
class SuppliersController < ApplicationController
  resource :supplier

  def show
    @supplier = Supplier.find(params[:id])
    authorize! :read, @supplier, 'You do not have access to this post'
    render json: { supplier: @supplier }
  rescue AccessGranted::AccessDenied => e
    render json: { error: e.message }, status: :forbidden
  end

  def create
    authorize! :create, Supplier
  end
end
