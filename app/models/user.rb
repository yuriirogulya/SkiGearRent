class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :items, foreign_key: 'owner_id'
  has_many :bookings, foreign_key: 'renter_id'
  has_many :reviews, as: :reviewable
  has_many :item_reviews, through: :items, source: :reviews
  has_many :written_reviews, foreign_key: :author_id, class_name: 'Review'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
end
