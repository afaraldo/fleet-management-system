require "rails_helper"

RSpec.describe WorkOrderMailer, type: :mailer do
  describe "pending_work_order_notification" do
    let(:recipient) { create(:user) }
    let(:mail) { WorkOrderMailer.with(recipient:).pending_work_orders_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Pending work orders notification")
      expect(mail.to).to eq([recipient.email.to_s])
      expect(mail.from).to eq(["example@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Estimado")
    end
  end

end
