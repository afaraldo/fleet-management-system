# Model for User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  has_one_attached :avatar # Active Storage
  has_many :notifications, as: :recipient, dependent: :destroy # https://github.com/excid3/noticed

  validates :email, presence: true
  validates :password, confirmation: { presence: true }

  def to_s
    "#{self.class.model_name.human} #{email}"
  end
  enum role: { admin: 0, secretary: 1, driver: 2 }
end
