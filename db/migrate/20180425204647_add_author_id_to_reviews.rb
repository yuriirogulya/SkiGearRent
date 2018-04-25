class AddAuthorIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :author_id, :integer
  end
  add_index :reviews, :author_id
end
