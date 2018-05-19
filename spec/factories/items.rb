FactoryBot.define do
  factory :item do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.paragraph }
    owner_id 1
    category_id 1
  end
end