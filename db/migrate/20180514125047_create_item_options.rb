class CreateItemOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :item_options do |t|
      t.belongs_to :item, index: true
      t.belongs_to :option, index: true
    end
  end
end
