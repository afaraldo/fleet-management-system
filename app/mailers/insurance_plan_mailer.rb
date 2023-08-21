class InsurancePlanMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.insurance_plan_mailer.insurance_plans_to_expire.subject
  #
  def insurance_plans_to_expire_notification
    @recipient = params[:recipient]
    @insurance_plans = InsurancePlan.all

    mail to: @recipient.email, subject: "Hay #{@insurance_plans.size} seguros próximos a vencer."
  end
end
