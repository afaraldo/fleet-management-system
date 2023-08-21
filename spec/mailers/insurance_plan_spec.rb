require "rails_helper"

RSpec.describe InsurancePlanMailer, type: :mailer do
  describe "insurance_plans_to_expire" do
    let(:mail) { InsurancePlanMailer.insurance_plans_to_expire }

    it "renders the headers" do
      expect(mail.subject).to eq("Insurance plans to expire")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
