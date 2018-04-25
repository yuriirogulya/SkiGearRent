class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :entity_id
      t.string :entity_type
      t.string :text
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, [:entity_id, :entity_type]
  end
end
