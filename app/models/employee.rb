# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  address    :string
#  document   :string
#  last_name  :string
#  name       :string
#  phone      :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employee < ApplicationRecord
  has_many :work_orders, dependent: :restrict_with_error
  validates :name, :last_name, :document, presence: true

  def full_name
    "#{name} #{last_name}"
  end

  def to_s
    full_name
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[address created_at document id last_name name phone position updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[work_orders]
  end
end
