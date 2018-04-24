FactoryBot.define do
  factory :review do
    text { FFaker::Lorem.paragraph }
    rating { rand 1..5 }
  end
end