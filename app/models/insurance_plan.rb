# == Schema Information
#
# Table name: insurance_plans
#
#  id                   :bigint           not null, primary key
#  amount               :integer          not null
#  contract_date        :date             not null
#  discarded_at         :datetime
#  expiry_date          :date
#  type_coverage        :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  insurance_carrier_id :bigint
#  organization_id      :bigint
#
# Indexes
#
#  index_insurance_plans_on_discarded_at          (discarded_at)
#  index_insurance_plans_on_expiry_date           (expiry_date)
#  index_insurance_plans_on_insurance_carrier_id  (insurance_carrier_id)
#  index_insurance_plans_on_organization_id       (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (insurance_carrier_id => suppliers.id)
#
class InsurancePlan < ApplicationRecord
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
  include AlgoliaSearch
  has_and_belongs_to_many :cars
  belongs_to :insurance_carrier
  validates :cars, presence: true
  delegate :name, to: :insurance_carrier, prefix: true

  scope :close_to_expire, -> { where(expiry_date: DateTime.now..1.week.from_now) }

  def to_s
    "Nro: #{id}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[amount contract_date created_at type_coverage expiry_date id insurance_carrier_id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cars insurance_carrier versions]
  end

  delegate :name, to: :insurance_carrier

  multi_tenant :organization
  algoliasearch enqueue: true, disable_indexing: Rails.env.test? do
    attributes :name, :contract_date, :title, :description

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    searchableAttributes %w[name last_name document]
  end

  def title
    insurance_carrier_name.to_s
  end

  def description
    I18n.l(contract_date, format: :default)
  end
end
