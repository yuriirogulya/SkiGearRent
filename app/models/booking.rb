class Booking < ApplicationRecord
  belongs_to :renter, class_name: 'User', foreign_key: 'renter_id'
  belongs_to :item

  validates :price, numericality: { only_integer: true }
  validates_presence_of :price, :start_date, :end_date
  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "start date can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date.present? && end_date < start_date
      errors.add(:end_date, "end date can't be before start date")
    end
  end

end