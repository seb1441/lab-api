class User < ApplicationRecord
  has_secure_password

  validates :username, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  composed_of :balance, class_name: "User", mapping: %w(balance user)
end
