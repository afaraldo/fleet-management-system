# Controller for Employee
class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]
  resource :employee
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:name, :last_name, :document, :address, :phone)
  end
end
