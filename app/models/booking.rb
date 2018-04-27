class Booking < ApplicationRecord
  belongs_to :user, foreign_key: 'renter_id'
  belongs_to :item
end
