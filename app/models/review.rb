class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user, foreign_key: 'author_id'
  
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5}
  validate :custom_validate

  def custom_validate
    if reviewable_type.equal?('Item')
      unless user.bookings.where(item_id: reviewable_id).exists?
        errors.add(:review, 'you never booked this item')
      end
    elsif reviewable_type.equal?('User')
      unless Booking.joins(:item).where('items.owner_id' => reviewable_id, 'renter_id' => user.id).exists?
        errors.add(:review, 'you never dealt with this user')
      end
    end
  end
end

