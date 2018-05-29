class Filter < ApplicationRecord
  belongs_to :category
  has_many :options

  validates_presence_of :name
end
