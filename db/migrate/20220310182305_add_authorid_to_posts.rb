class AddAuthoridToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :authorid, :integer
  end
end
