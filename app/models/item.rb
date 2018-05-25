class Item < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :category
  has_many :reviews, as: :reviewable
  has_many :bookings
  has_and_belongs_to_many :options
  has_one :city, through: :user

  validates_presence_of :name, :owner

  scope :with_name, -> (name) do
    i = arel_table
    where(i[:name].matches("%#{name}%"))
  end

  scope :with_category, -> (category) do
    c = Category.arel_table
    joins(:category).where(c[:id].eq(category))
  end

  scope :with_options, -> (options) do
    io = Arel::Table.new(:items_options) 
    joins(:items_options).where(io[:option_id].in(options))
  end
  
  scope :with_price, -> (min, max, days) do
    i = arel_table
    total_price = days.present? ? i[:daily_price] * days.to_i : i[:daily_price]
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