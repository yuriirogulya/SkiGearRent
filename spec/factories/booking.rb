FactoryBot.define do
  factory :booking do
    id 1
    renter_id 1
    item_id 10
    price 1000
    start_date FFaker::Time.between(Time.now, 10.days.after)
    end_date FFaker::Time.between(15.days.after, 30.days.after)
  end
end
