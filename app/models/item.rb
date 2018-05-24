class Item < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :category
  has_many :reviews, as: :reviewable
  has_many :bookings
  has_and_belongs_to_many :options
  has_one :city, through: :user

  validates_presence_of :name, :owner

  scope :with_name,     -> (name)     { where('name ilike ?', "%#{name}%") }
  scope :with_category, -> (category) { joins(:category).where('category_id = ?',  category) }
  scope :with_option,   -> (option)   { joins(:items_options).where('option_id = ?', option) }

  scope :with_price, -> (min, max, days) do
    i = arel_table
    total_price = i[:daily_price] * days
    where(total_price.in(min..max))
  end

  scope :booked, -> (start_date, end_date) do
    b = Booking.arel_table
    joins(:bookings).where(b[:start_date].lteq(end_date).and(b[:end_date].gteq(start_date)))
  end

  scope :available, -> (start_date, end_date) do
    i = arel_table
    booked_items = booked(start_date, end_date).ids
    where(i[:id].not_in(booked_items))
  end
end