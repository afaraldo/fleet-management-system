# This model represents a employee
class Employee < ApplicationRecord
  has_many :work_orders, dependent: :restrict_with_error
  validates :name, :last_name, :document, presence: true
  def full_name
    "#{name} #{last_name}"
  end

  def to_s
    full_name
  end
end
