#require 'ffaker'

# # Cities
# 2.times do
#  City.create(name: FFaker::Address.city)
# end

# # Categories
# 5.times do |n|
#   Category.create(name: "Category ##{n+1}")
# end

# # Users
# 10.times do
#   name = FFaker::Internet.user_name
#   User.create(
#     username: name,
#     email: "#{name}@example.com".downcase,
#     password: FFaker::Internet.password,
#     city_id: rand(1..2)
#   )
#end

# Items
#  20.times do |n|
#    Item.create(
#      owner_id: rand(1..10),
#      name: FFaker::Product.product_name ,
#      description: FFaker::Lorem.phrase,
#      category_id: rand(1..5),
#      daily_price: rand(1000..3000)
#    )
#  end

# Not completed bookings
# 10.times do
#   Booking.create(
#     renter_id: rand(1..20),
#     item_id: rand(1..40),
#     price: rand(1_000..10_000),
#     start_date: FFaker::Time.between(2.days.ago, Time.now),
#     end_date: FFaker::Time.between(5.days.after, 10.days.after),
#     completed: false
#   )
#end
