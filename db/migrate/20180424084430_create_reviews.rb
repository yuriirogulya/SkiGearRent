class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :reviewable_id
      t.string :reviewable_type
      t.string :text
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
