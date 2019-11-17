class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}

  has_many :artists
end
