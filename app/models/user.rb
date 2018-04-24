class User < ApplicationRecord
  has_many :items
  has_many :bookings
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
end
