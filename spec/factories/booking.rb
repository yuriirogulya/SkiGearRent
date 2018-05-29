FactoryBot.define do
  factory :booking do
    renter
    item
    price { rand 1000..10000 }
    start_date FFaker::Time.between(Time.now, 10.days.after)
    end_date FFaker::Time.between(15.days.after, 30.days.after)
  end
end
