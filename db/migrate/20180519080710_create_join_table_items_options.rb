class CreateJoinTableItemsOptions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :items, :options do |t|
      t.index [:item_id, :option_id]
      t.index [:option_id, :item_id]
    end
  end
end
