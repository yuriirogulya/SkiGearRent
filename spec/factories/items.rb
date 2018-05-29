FactoryBot.define do
  factory :item do
    name { FFaker::Product.product_name }
    description 'some text'
    owner
    category
  end
end