class FixPriceTypeInItems < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :price, :integer
  end
end
