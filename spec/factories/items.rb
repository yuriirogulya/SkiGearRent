FactoryBot.define do
  factory :item do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.paragraph }
    owner_id nil
  end
end