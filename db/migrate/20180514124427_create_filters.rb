class CreateFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :filters do |t|
      t.integer :category_id
      t.string :name

      t.timestamps
    end
    add_index :filters, :category_id
  end
end
