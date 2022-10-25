class Supplier < ApplicationRecord
  validates :type, presence: true
  # Law of Demeter
  delegate :name, to: :mechanical_workshop, prefix: :true
end
