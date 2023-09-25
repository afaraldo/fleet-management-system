class InsurancePlanMailer < ApplicationMailer
  default from: Rails.application.credentials.sendgrid.domain!

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.insurance_plan_mailer.insurance_plans_to_expire.subject
  #
  def insurance_plans_to_expire_notification
    @recipient = params[:recipient]
    @insurance_plans = InsurancePlan.where(id: params[:insurance_plans_close_to_expire_ids])
    subject = params[:message]

    mail to: @recipient.email, subject:
  end
end
