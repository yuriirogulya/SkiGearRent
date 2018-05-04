class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user, foreign_key: 'author_id'
  
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5}
  validate :cannot_review_item_you_never_booked, :cannot_review_user_you_never_dealt

  def cannot_review_item_you_never_booked
    if reviewable_type == 'Item'
      unless user.bookings.where(item_id: reviewable_id).exists?
        errors.add(:review, 'you never booked this item')
      end
    end
  end

  def cannot_review_user_you_never_dealt
    if reviewable_type == 'User'
      unless Booking.joins(:item)
        .where('items.owner_id' => reviewable_id, 'renter_id' => author_id)
        .or(Booking.joins(:item)
        .where('items.owner_id' => author_id, 'renter_id' => reviewable_id)).exists?
        errors.add(:review, 'you never dealt with this user')
      end
    end
  end

end

