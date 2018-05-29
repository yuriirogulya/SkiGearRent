require 'rails_helper'

RSpec.describe Item, :type => :model do

  describe 'responds' do
    it 'should have all the scopes' do
      expect(Item).to respond_to(:by_name)
      expect(Item).to respond_to(:by_category)
      expect(Item).to respond_to(:by_options)
      expect(Item).to respond_to(:by_price)
      expect(Item).to respond_to(:booked)
      expect(Item).to respond_to(:available)
    end
  end

  describe '.by_name' do
    let!(:item1) { create(:item, name: 'some item name') }
    let!(:item2) { create(:item, name: 'hello dear world') }

    it 'return item with certain word in beginning of name' do
      expect(Item.by_name('hello').count).to eq(1)
    end
    it 'return item with certain word in middle of name' do
      expect(Item.by_name('dear').count).to eq(1)
    end
    it 'return item with certain word in end of word' do
      expect(Item.by_name('world').count).to eq(1)
    end
  end

  describe '.by_category' do
    let!(:category1) { create(:category) }
    let!(:category2) { create(:category, name: 'CategoryName') }
    let!(:item1) { create(:item, category: category1) }
    let!(:item2) { create(:item, category: category2) }

    it 'return item with existing category' do
      expect(Item.by_category(category1).count).to eq(1)
    end
  end

  describe '.by_options' do
    let!(:item1) do
      create(:item, options: [option_brand1, option_size1])
    end
    let!(:item2) do 
      create(:item, options: [option_brand2, option_size2])
    end
    let!(:option_brand1) { create(:option, name: 'Nike') }
    let!(:option_brand2) { create(:option, name: 'Adidas') }
    let!(:option_size1) { create(:option, name: '40') }
    let!(:option_size2) { create(:option, name: '42') }

    it "return items with brand 'Nike' and size '42' options" do
      expect(Item.by_options([option_brand1, option_size2]).count).to eq(2)
    end
    it "return items with brand 'Nike' only" do
      expect(Item.by_options([option_brand1]).count).to eq(1)
    end
  end

  describe '.with_price' do
    let!(:item1) { create(:item, daily_price: 1000) }
    let!(:item2) { create(:item, daily_price: 2000) }

    it 'return items with price range without days number' do
      expect(Item.by_price(500, 1500).count).to eq(1)
    end
    it 'return items with price range with explicit days number' do
      expect(Item.by_price(7000, 12000, 10).count).to eq(1)
    end
    it 'not return items with wrong price range' do
      expect(Item.by_price(500, 700).count).to eq(0)
    end
  end

  describe '.booked, .available' do
    let!(:item1) { create(:item) }
    let!(:item2) { create(:item) }
    let!(:booking1) { create(:booking, item: item1, start_date:'2018-06-10', end_date: '2018-06-20') }
    let!(:booking2) { create(:booking, item: item2, start_date:'2018-06-10', end_date: '2018-06-15') }

    it 'return booked items' do
      expect(Item.booked('2018-06-16', '2018-06-25').count).to eq(1)
    end
    it 'return available items' do
      expect(Item.available('2018-06-21', '2018-06-25').count).to eq(2)
    end
  end
end
