class ChnageIntegerLimitInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :authorid, :integer, limit: 8
  end
end
