class Review < ApplicationRecord
  belongs_to :item
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5}
end
