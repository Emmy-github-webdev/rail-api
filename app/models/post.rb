class Post < ApplicationRecord
  has_many :comment, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :authorid
end
