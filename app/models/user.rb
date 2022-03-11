class User < ApplicationRecord
  has_many :comment, dependent: :destroy
  has_many :post, dependent: :destroy
  # encrypt password
  has_secure_password

  # Validations
  validates_presence_of :name, :email, :password_digest
end
