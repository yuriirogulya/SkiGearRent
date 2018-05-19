class Item < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :category
  has_many :reviews, as: :reviewable
  has_many :bookings
  has_and_belongs_to_many :options
  has_one :city, through: :user

  validates_presence_of :name, :owner

  scope :with_name,     -> (name) { where('name like ?', "%#{name}%")}
  scope :with_category, -> (category) { joins(:category).where('categories.name = ?', category) }
end