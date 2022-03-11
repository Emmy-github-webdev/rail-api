class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates_presence_of :text
end
