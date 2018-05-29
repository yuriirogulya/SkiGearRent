FactoryBot.define do
  factory :user, aliases: [:owner, :renter] do
    username { FFaker::Internet.user_name }
    email { "#{username}@example.com".downcase }
    password { FFaker::Internet.password }
    city
  end
end