FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    username { FFaker::Name.first_name }
    city { FFaker::Address.city }
  end
end