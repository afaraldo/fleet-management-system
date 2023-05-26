# Model for User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable

  has_one_attached :avatar # Active Storage
  has_many :notifications, as: :recipient, dependent: :destroy # https://github.com/excid3/noticed

  validates :email, presence: true
  validates :password, confirmation: { presence: true }

  def to_s
    "#{self.class.model_name.human} #{email}"
  end

  enum role: { admin: 0, secretary: 1, driver: 2 }

  def self.ransackable_attributes(auth_object = nil)
    %w[email last_sign_in_at profile_foto reset_password_sent_at reset_password_token ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[avatar_attachment avatar_blob notifications versions]
  end
end
