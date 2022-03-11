class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates_presence_of :text

  after_save :update_comments

  private

  def update_comments
    post.update(commentCounter: post.comments.length)
  end
end
