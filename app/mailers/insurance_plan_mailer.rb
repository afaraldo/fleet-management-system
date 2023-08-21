class InsurancePlanMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.insurance_plan_mailer.insurance_plans_to_expire.subject
  #
  def insurance_plans_to_expire
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
