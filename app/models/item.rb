class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'owner_id'
  has_many :reviews, as: :reviewable
  has_many :bookings
  has_one :city, through: :user
  
  validates :name, presence: true
end
