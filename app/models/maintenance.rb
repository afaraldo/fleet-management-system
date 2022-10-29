class Maintenance < ApplicationRecord
  belongs_to :mechanical_workshop
  belongs_to :car
end
