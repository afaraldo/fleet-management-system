class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  has_one_attached :avatar # Active Storage
  has_many :notifications, as: :recipient, dependent: :destroy # https://github.com/excid3/noticed

  validates :email, presence: true
end
