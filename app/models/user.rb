class User < ApplicationRecord
  belongs_to :city
  has_many :items, foreign_key: 'owner_id'
  has_many :bookings
  has_many :reviews, through: :items, as: :reviewable, foreign_key: 'author_id'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
end




