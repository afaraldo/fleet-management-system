# Controller for InsurancePlan model
class InsurancePlansController < ApplicationController
  resource :insurance_plan

  def model_params
    params.require(:insurance_plan).permit(:contract_date, :expiry_date, :type_coverage, :amount, :insurance_carrier_id, car_ids: [])
  end
end
