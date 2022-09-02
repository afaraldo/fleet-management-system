# Controller for Employee
class EmployeesController < ApplicationController
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
