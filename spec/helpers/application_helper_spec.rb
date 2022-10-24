require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe ".datetime_format" do
    let(:date){ rand(1..10).days.ago }
    context "get a date params" do
      it { expect(helper.datetime_format(date)).to eq(date.strftime("%d/%m/%Y %H:%M")) }
    end

    context "get a nil params" do
      it { expect(helper.datetime_format(nil)).to eq(nil) }
    end
  end
end
