# == Schema Information
#
# Table name: suppliers
#
#  id              :bigint           not null, primary key
#  discarded_at    :datetime
#  name            :string           not null
#  ruc             :string           not null
#  type            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_suppliers_on_discarded_at     (discarded_at)
#  index_suppliers_on_organization_id  (organization_id)
#
require 'rails_helper'

RSpec.describe InsuranceCarrier do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:ruc) }
  it { should validate_presence_of(:type) }
end
