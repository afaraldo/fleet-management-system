class Maintenance < ApplicationRecord
  belongs_to :mechanical_workshop
  belongs_to :car
  delegate :name, to: :mechanical_workshop, prefix: true
end
