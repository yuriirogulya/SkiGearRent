class User < ApplicationRecord
  has_many :items
  has_many :bookings
  has_many :reviews, as: :reviewable
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
end
