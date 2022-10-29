class InsurancePlansController < ApplicationController
  before_action :set_insurance_plan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @insurance_plans = InsurancePlan.all
    respond_with(@insurance_plans)
  end

  def show
    respond_with(@insurance_plan)
  end

  def new
    @insurance_plan = InsurancePlan.new
    respond_with(@insurance_plan)
  end

  def edit
  end

  def create
    @insurance_plan = InsurancePlan.new(insurance_plan_params)
    flash[:notice] = 'InsurancePlan was successfully created.' if @insurance_plan.save
    respond_with(@insurance_plan)
  end

  def update
    flash[:notice] = 'InsurancePlan was successfully updated.' if @insurance_plan.update(insurance_plan_params)
    respond_with(@insurance_plan)
  end

  def destroy
    @insurance_plan.destroy
    respond_with(@insurance_plan)
  end

  private
    def set_insurance_plan
      @insurance_plan = InsurancePlan.find(params[:id])
    end

    def insurance_plan_params
      params.require(:insurance_plan).permit(:contract_date, :car_id, :amount, :exp_date)
    end
end
