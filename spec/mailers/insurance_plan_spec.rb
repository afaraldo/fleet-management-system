require "rails_helper"

RSpec.describe InsurancePlanMailer, type: :mailer do
  describe "insurance_plans_to_expire" do
    let(:recipient) { create(:user) }
    let(:mail) { InsurancePlanMailer.with(recipient:).insurance_plans_to_expire_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Insurance plans to expire notification")
      expect(mail.to).to eq([recipient.email.to_s])
      expect(mail.from).to eq(["example@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Estimado")
    end
  end

end
