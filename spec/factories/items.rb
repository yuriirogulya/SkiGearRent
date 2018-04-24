FactoryBot.define do
  factory :item do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.paragraph }
  end
end