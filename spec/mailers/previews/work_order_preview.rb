# Preview all emails at http://localhost:3000/rails/mailers/work_order
class WorkOrderPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/work_order/pending_work_order_notification
  def pending_work_order_notification
    WorkOrderMailer.with(recipient: User.first).pending_work_order_notification
  end

end
