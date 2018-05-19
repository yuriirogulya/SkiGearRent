FactoryBot.define do
  factory :user do
    id 1
    username { FFaker::Internet.user_name }
    email { "#{username}@example.com".downcase }
    password { FFaker::Internet.password }
    city_id 1
  end
end