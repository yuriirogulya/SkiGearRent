class Category < ApplicationRecord
  has_many :items
  has_many :filters

  validates_presence_of :name
end
