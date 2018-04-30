require 'ffaker'
10.times do
  Booking.create({
    renter_id: rand(1..6),
    item_id: rand(1..12),
    price: rand(1000..10000),
    start_date: FFaker::Time.between(2.days.ago, Time.now),
    end_date: FFaker::Time.between(5.days.after, 10.days.after),
    completed: false
  })
end

10.times do
  Booking.create({
    renter_id: rand(1..6),
    item_id: rand(1..12),
    price: rand(1000..10000),
    start_date: FFaker::Time.between(3.month.ago, 2.month.ago),
    end_date: FFaker::Time.between(2.month.ago, 1.month.ago),
    completed: true 
  })
end