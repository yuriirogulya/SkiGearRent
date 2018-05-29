FactoryBot.define do
  factory :item do
    name { FFaker::Product.product_name }
    description 'some text'
    daily_price 1000
    owner
    category
  end
end