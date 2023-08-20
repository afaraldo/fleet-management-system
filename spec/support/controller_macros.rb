module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryBot.create(:user, { password: "HolaMundo123", password_confirmation: "HolaMundo123" })
      sign_in user
    end
  end
end