class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :owner_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :items, :owner_id
  end
end
