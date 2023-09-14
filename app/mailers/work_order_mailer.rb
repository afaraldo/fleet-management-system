class WorkOrderMailer < ApplicationMailer
  default from: Rails.application.credentials.sendgrid.domain
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.work_order_mailer.pending_work_order_notification.subject
  #
  def pending_work_orders_notification
    @recipient = params[:recipient]
    @work_orders = WorkOrder.pending

    mail to: @recipient.email, subject: "Hay #{@work_orders.size} nuevas Órdenes de Trabajo."
  end
end
