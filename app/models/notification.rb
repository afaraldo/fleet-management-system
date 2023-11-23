# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  params          :jsonb
#  read_at         :datetime
#  recipient_type  :string           not null
#  type            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  recipient_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_organization_id  (organization_id)
#  index_notifications_on_read_at          (read_at)
#  index_notifications_on_recipient        (recipient_type,recipient_id)
#
class Notification < ApplicationRecord
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
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  multi_tenant :organization

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at updated_at]
  end
end
