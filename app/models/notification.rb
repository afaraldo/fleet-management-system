class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at updated_at]
  end
end
