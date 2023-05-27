# Supplier Model
class Supplier < ApplicationRecord
  validates :type, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name ruc type updated_at]
  end
end
