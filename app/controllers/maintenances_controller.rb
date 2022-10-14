class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @maintenances = Maintenance.all
    respond_with(@maintenances)
  end

  def show
    respond_with(@maintenance)
  end

  def new
    @maintenance = Maintenance.new
    respond_with(@maintenance)
  end

  def edit
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)
    flash[:notice] = 'Maintenance was successfully created.' if @maintenance.save
    respond_with(@maintenance)
  end

  def update
    flash[:notice] = 'Maintenance was successfully updated.' if @maintenance.update(maintenance_params)
    respond_with(@maintenance)
  end

  def destroy
    @maintenance.destroy
    respond_with(@maintenance)
  end

  private
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:date, :mechanical_workshop_id, :budget, :car_id, :description)
    end
end
