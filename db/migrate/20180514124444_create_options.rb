class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.integer :filter_id
      t.string :name

      t.timestamps
    end
    add_index :options, :filter_id
  end
end
