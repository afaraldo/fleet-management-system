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
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_discarded_at          (discarded_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable

  has_one_attached :avatar # Active Storage
  has_many :notifications, as: :recipient, dependent: :destroy # https://github.com/excid3/noticed

  validates :email, presence: true
  validates :password, confirmation: { presence: true }

  # SCOPE
  scope :administrative_only, -> { where(role: %w[admin secretary]) }
  scope :notifications_activated, -> { where(receive_notifications: true) }

  def to_s
    "#{self.class.model_name.human} #{email}"
  end

  enum role: { admin: 0, secretary: 1, superadmin: 2 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[email last_sign_in_at profile_foto reset_password_sent_at reset_password_token]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[avatar_attachment avatar_blob notifications versions]
  end
end
