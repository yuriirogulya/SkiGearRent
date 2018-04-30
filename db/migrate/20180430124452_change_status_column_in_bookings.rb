class ChangeStatusColumnInBookings < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookings, :status, :completed
  end
end
