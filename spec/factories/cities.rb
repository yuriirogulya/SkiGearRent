FactoryBot.define do
  factory :city do
    id 1
    name { FFaker::Address.city }
  end
end