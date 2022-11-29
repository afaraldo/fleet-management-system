class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  validates :email, presence: true

  enum role: { admin: 0, member: 1, guest: 2, moderator: 3 }, _default: 0
end
