# This class is a user controller
class UsersController < ApplicationController
  resource :user

  private

  def extra_params
    %i[password password_confirmation]
  end
end
