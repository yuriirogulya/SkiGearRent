class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :renter_id
      t.integer :item_id
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.boolean :completed, default: false

      t.timestamps
    end
    add_index :bookings, :renter_id
    add_index :bookings, :item_id
  end
end
