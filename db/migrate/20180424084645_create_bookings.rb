class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.decimal :price
      t.date :start_date
      t.date :end_date
      t.boolean :status

      t.timestamps
    end
  end
end
