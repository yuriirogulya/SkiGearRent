class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user, foreign_key: 'author_id'
  
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5}
  validate :custom_validate

  def custom_validate
    
  end

end
