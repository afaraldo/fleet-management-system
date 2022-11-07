# This model represents a employee
class Employee < ApplicationRecord
  def full_name
    name + last_name
  end
end
