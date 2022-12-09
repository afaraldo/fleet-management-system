# This class is a user controller
class UsersController < ApplicationController
  resource :user

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
