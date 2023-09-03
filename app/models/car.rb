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
#
# Indexes
#
#  index_cars_on_discarded_at  (discarded_at)
#  index_cars_on_plate_number  (plate_number) UNIQUE
#  index_cars_on_rasp          (rasp)
#
class Car < ApplicationRecord
  has_many :work_orders, dependent: :destroy
  has_many :maintenances, dependent: :destroy
  has_and_belongs_to_many :insurance_plans
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

  def to_s
    "#{type_car} #{make} #{model} #{plate_number}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[chassis color created_at engine horometro id make model plate_number assigned_dependency rasp updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[maintenances work_orders insurance_plans]
  end
end
