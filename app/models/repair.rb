# This model represents a reapi
class Repair < ApplicationRecord
  belongs_to :car
  belongs_to :mechanical_workshop
  delegate :name, to: :mechanical_workshop, prefix: true
end
