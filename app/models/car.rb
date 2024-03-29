# == Schema Information
#
# Table name: cars
#
#  id                  :bigint           not null, primary key
#  assigned_dependency :string
#  chassis             :string
#  color               :string
#  discarded_at        :datetime
#  horometro           :boolean          default(FALSE), not null
#  make                :string
#  model               :string
#  plate_number        :string
#  rasp                :string
#  type_car            :string           not null
#  year                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint
#
# Indexes
#
#  index_cars_on_discarded_at                      (discarded_at)
#  index_cars_on_organization_id                   (organization_id)
#  index_cars_on_plate_number                      (plate_number)
#  index_cars_on_plate_number_and_organization_id  (plate_number,organization_id) UNIQUE
#  index_cars_on_rasp                              (rasp)
#
class Car < ApplicationRecord
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
  include Rails.application.routes.url_helpers

  has_many :work_orders, dependent: :destroy
  has_many :maintenances, dependent: :destroy
  has_and_belongs_to_many :insurance_plans
  has_one_attached :image

  delegate :plate_number, to: :insurance_plans, prefix: true

  validates :type_car, :make, :plate_number, presence: true

  def self.query_search
    lambda do |params|
      ransack({
                id_eq: params[:q],
                plate_number_cont: params[:q]
              }).result.distinct
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[chassis color created_at engine horometro id make model plate_number assigned_dependency rasp updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[maintenances work_orders insurance_plans]
  end

  multi_tenant :organization
  algoliasearch enqueue: true, disable_indexing: Rails.env.test? do
    attributes :plate_number, :type_car, :rasp, :model, :year, :make, :color, :chassis, :assigned_dependency

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    searchableAttributes %w[plate_number type_car rasp model year make color chassis assigned_dependency]
  end

  def title
    "#{plate_number} RASP: #{rasp}"
  end

  def description
    "#{type_car} #{model} #{year}"
  end

  def url
    car_path(self)
  end

  def to_s
    "#{type_car} #{make} #{model} #{plate_number}"
  end

  def text
    to_s
  end
end
