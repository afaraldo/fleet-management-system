# This class is a user controller
class UsersController < ApplicationController
  resource :user

  # GET
  def edit
    if can? :read, User
      add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
      add_breadcrumb I18n.t('buttons.edit'), nil # Use for breadcrumbs_on_rails gem
    else
      add_breadcrumb I18n.t("activerecord.models.#{resource_name}.other"), polymorphic_url(plural_resource_name, params: session[controller_name], only_path: true) # Use for breadcrumbs_on_rails gem
    end
  end

  private

  def model_params
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
    params.require(:user).permit(_params)
  end

  def extra_params
    %i[password password_confirmation]
  end
end
