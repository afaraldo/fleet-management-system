class RepairsController < ApplicationController
  before_action :set_repair, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @repairs = Repair.all
    respond_with(@repairs)
  end

  def show
    respond_with(@repair)
  end

  def new
    @repair = Repair.new
    respond_with(@repair)
  end

  def edit
  end

  def create
    @repair = Repair.new(repair_params)
    flash[:notice] = 'Repair was successfully created.' if @repair.save
    respond_with(@repair)
  end

  def update
    flash[:notice] = 'Repair was successfully updated.' if @repair.update(repair_params)
    respond_with(@repair)
  end

  def destroy
    @repair.destroy
    respond_with(@repair)
  end

  private
    def set_repair
      @repair = Repair.find(params[:id])
    end

    def repair_params
      params.require(:repair).permit(:date, :car_id, :mechanical_workshop_id, :repairs)
    end
end
