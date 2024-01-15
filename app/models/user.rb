# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  discarded_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  profile_foto           :string
#  receive_notifications  :boolean          default(FALSE), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  organization_id        :bigint
#
# Indexes
#
#  index_users_on_discarded_at               (discarded_at)
#  index_users_on_email                      (email)
#  index_users_on_email_and_organization_id  (email,organization_id) UNIQUE
#  index_users_on_organization_id            (organization_id)
#  index_users_on_reset_password_token       (reset_password_token)
#
class User < ApplicationRecord
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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable
  multi_tenant :organization

  has_one_attached :avatar # Active Storage
  has_one :employee
  has_many :notifications, as: :recipient, dependent: :destroy # https://github.com/excid3/noticed

  validates :email, presence: true
  validates :password, confirmation: { presence: true }
  validates :email, uniqueness: { scope: :organization_id }

  # SCOPE
  scope :administrative_only, -> { where(role: %w[admin secretary]) }
  scope :notifications_activated, -> { where(receive_notifications: true) }

  enum role: { admin: 'ADMIN', driver: 'DRIVER', secretary: 'SECRETARY', superadmin: 'SUPERADMIN' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[email last_sign_in_at profile_foto reset_password_sent_at reset_password_token]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[avatar_attachment avatar_blob notifications versions]
  end

  def self.find_for_database_authentication(warden_conditions)
    Rails.logger.info { warden_conditions.inspect.to_s }

    conditions = warden_conditions.dup
    email = conditions.delete(:email)
    organization_id = conditions.delete(:organization_id)
    user = where(email:, organization_id:).first
    Rails.logger.error { user&.inspect&.to_s }

    user
  end

  def to_s
    "#{self.class.model_name.human} #{email}"
  end
end
