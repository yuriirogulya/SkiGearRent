class AddItemIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :item_id, :integer
  end
end
