# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  ruc        :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Supplier < ApplicationRecord
  validates :type, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name ruc type updated_at]
  end
end
