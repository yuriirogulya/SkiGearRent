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
    t = arel_table
    total_price = t[:daily_price] * days
    where(total_price.gteq(min).and(total_price.lteq(max)))
  end
end