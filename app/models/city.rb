class City < ApplicationRecord
  has_many :users

  validates :name, presence: true
  
  def all_items_in_particular_city
    self.users.map(&:items)
  end
end

