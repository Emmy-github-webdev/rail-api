class AddPostReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :post, foreign_key: true
  end
end
