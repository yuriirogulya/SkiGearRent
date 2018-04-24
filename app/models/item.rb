class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates :name, presence: true
end
