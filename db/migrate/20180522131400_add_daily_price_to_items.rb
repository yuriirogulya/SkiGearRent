class AddDailyPriceToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :daily_price, :integer
  end
end
