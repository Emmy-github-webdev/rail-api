class User < ApplicationRecord
  has_many :comment, dependent: :destroy
  # encrypt password
  has_secure_password

  # Model associations
  has_many :posts, foreign_key: :authorid
  # Validations
  validates_presence_of :name, :email, :password_digest
end
