require 'rails_helper'

RSpec.describe Supplier, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:ruc) }
      it { should validate_presence_of(:type) }
    end
end
