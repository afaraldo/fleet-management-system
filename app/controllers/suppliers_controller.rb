# Controller for Suppliers model
class SuppliersController < ApplicationController
  resource :supplier

  def show
    @supplier = Supplier.find(params[:id])
    authorize! :read, @supplier, 'No tienes acceso a ésta pantalla.'
    render json: { supplier: @supplier }
  rescue AccessGranted::AccessDenied => e
    render json: { error: e.message }, status: :forbidden
  end
end
