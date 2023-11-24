# CustomSession
class CustomSessionsController < Devise::SessionsController
  def new
    super do
      @organization = Organization.find_by(name: params[:org]) || Organization.first
      @logo_url = @organization&.logo&.url
    end
  end
end
