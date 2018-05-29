class City < ApplicationRecord
  has_many :users
  has_many :items, through: :users

  validates_presence_of :name
end
