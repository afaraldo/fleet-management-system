# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  # Constants
  # Enums
  # Associations (belongs_to, has_one, has_many, has_and_belongs_to_many)
  # Extensions (includes Rails concerns)
  # Scopes
  # Validations
  # Callbacks (before_save, after_commit, etc.)
  # Delegations
  # Virtual attributes (attr_accessor, etc.)
  # Class methods (self.method)
  # Instance methods
  # Private methods
  has_one_attached :logo

  has_many :cars, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :maintenances, dependent: :destroy
  has_many :repairs, dependent: :destroy
  has_many :suppliers, dependent: :destroy
  has_many :work_orders, dependent: :destroy
  has_many :insurance_carriers, dependent: :destroy
  has_many :mechanical_workshops, dependent: :destroy
end
