# This class represents a Maintenance
class Maintenance < ApplicationRecord
  belongs_to :mechanical_workshop
  belongs_to :car
  delegate :name, to: :mechanical_workshop, prefix: true

  def to_s
    "#{self.class.model_name.human} Nro: #{id}"
  end
end
