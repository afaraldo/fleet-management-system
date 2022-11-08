# This model represents a employee
class Employee < ApplicationRecord
  has_many :work_orders, dependent: :restrict_with_error
  def full_name
    "#{name} #{last_name}"
  end
end
