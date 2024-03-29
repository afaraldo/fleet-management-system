class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @organizations = Organization.all
    respond_with(@organizations)
  end

  def show
    respond_with(@organization)
  end

  def new
    @organization = Organization.new
    respond_with(@organization)
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    flash[:notice] = 'Organization was successfully created.' if @organization.save
    respond_with(@organization)
  end

  def update
    flash[:notice] = 'Organization was successfully updated.' if @organization.update(organization_params)
    respond_with(@organization)
  end

  def destroy
    @organization.destroy
    respond_with(@organization)
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name)
    end
end
