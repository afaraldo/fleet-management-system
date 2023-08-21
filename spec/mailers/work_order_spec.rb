require "rails_helper"

RSpec.describe WorkOrderMailer, type: :mailer do
  describe "pending_work_order_notification" do
    let(:mail) { WorkOrderMailer.pending_work_order_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Pending work order notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
