require 'ffaker'

# Cities
#10.times do
#  City.create(name: FFaker::Address.city)
#end

# Users
20.times do
  name = FFaker::Internet.user_name
  User.create(
    username: name,
    email: "#{name}@example.com".downcase,
    password: FFaker::Internet.password,
    city_id: rand(1..4)
  )
end

# Items
40.times do |n|
  Item.create(
    owner_id: rand(1..20),
    name: "Item##{n+1}",
    description: FFaker::Lorem.paragraph
  )
end

# Not completed bookings
10.times do
  Booking.create(
    renter_id: rand(1..6),
    item_id: rand(1..12),
    price: rand(1_000..10_000),
    start_date: FFaker::Time.between(2.days.ago, Time.now),
    end_date: FFaker::Time.between(5.days.after, 10.days.after),
    completed: false
  )
end

# Completed bookings
10.times do
  Booking.create(
    renter_id: rand(1..6),
    item_id: rand(1..12),
    price: rand(1_000..10_000),
    start_date: FFaker::Time.between(3.month.ago, 2.month.ago),
    end_date: FFaker::Time.between(2.month.ago, 1.month.ago),
    completed: true
  )
end
