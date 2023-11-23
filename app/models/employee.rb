# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  address         :string
#  discarded_at    :datetime
#  document        :string
#  last_name       :string
#  name            :string
#  phone           :string
#  position        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_employees_on_discarded_at     (discarded_at)
#  index_employees_on_document         (document)
#  index_employees_on_organization_id  (organization_id)
#
class Employee < ApplicationRecord
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

  has_many :work_orders, dependent: :restrict_with_error

  validates :name, :last_name, :document, presence: true

  multi_tenant :organization
  algoliasearch enqueue: true, disable_indexing: Rails.env.test? do
    attributes :name, :last_name, :document, :title, :description

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    searchableAttributes %w[name last_name document]
  end

  def title
    "#{name} #{last_name}"
  end

  def description
    document.to_s
  end

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
