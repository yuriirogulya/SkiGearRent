class Filter < ApplicationRecord
  belongs_to :category
  has_many :options
end
