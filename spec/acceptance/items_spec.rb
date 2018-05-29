require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Items' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

    get '/items' do
      let!(:items) { create_list(:item, 5) }
      example_request 'Getting all items request' do
        expect(status).to eq(200)
        json = JSON.parse(response_body)
        expect(json.count).to eq(5)
      end
    end

    get '/items?name=hello' do
      let!(:item1) { create(:item, name: 'someitem') }
      let!(:item2) { create(:item, name: 'hello world') }
      example_request 'Getting items with cetrain word in name' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(1)
      end
    end

    get '/items?category=1' do
      let!(:category1) { create(:category, id: 1) }
      let!(:category2) { create(:category, id: 2) }
      let!(:item1) { create(:item, category: category1) }
      let!(:item2) { create(:item, category: category2) }
      example_request 'Getting items with certain category' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(1)
      end
    end

    get '/items?options[]=3' do
      let!(:option1) { create(:option, id: 1) }
      let!(:option2) { create(:option, id: 2) }
      let!(:option3) { create(:option, id: 3) }
      let!(:item1) { create(:item, options: [option2]) }
      let!(:item2) { create(:item, options: [option1, option3]) }
      let!(:item3) { create(:item, options: [option2, option3]) }
      example_request 'Getting items with certain options' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(2)
      end
    end

    get '/items?price[min]=500&price[max]=1000' do
      let!(:item1) { create(:item, daily_price: 500) }
      let!(:item2) { create(:item, daily_price: 1500) }
      let!(:item3) { create(:item, daily_price: 1000) }
      example_request 'Getting items with certain price range' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(2)
      end
    end

    get '/items?price[min]=5000&price[max]=6000&price[days]=5' do
      let!(:item1) { create(:item, daily_price: 500) }
      let!(:item2) { create(:item, daily_price: 1500) }
      let!(:item3) { create(:item, daily_price: 1000) }
      example_request 'Getting items with certain price range and days number' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(1)
      end
    end
    
    get '/items?available[start_date]=2018-06-16&available[end_date]=2018-06-20' do
      let!(:item1) { create(:item) }
      let!(:item2) { create(:item) }
      let!(:booking1) { create(:booking, item: item1, start_date:'2018-06-10', end_date: '2018-06-20') }
      let!(:booking2) { create(:booking, item: item2, start_date:'2018-06-10', end_date: '2018-06-15') }
      example_request 'Getting available items by time range' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(1)
      end
    end

    get '/items/:item_id' do
      let!(:item) { create(:item) }
      let(:item_id) { item.id}
      example_request 'Getting item request by id' do
        expect(status).to eq(200)
        expect(response_body).to eq(item.to_json)
      end        
    end

    get '/items/:wrong_id' do
      let(:wrong_id) { 0 }
      example 'Getting item request with wrong id' do
        expect { do_request }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  
    post "/items?name=item_name&owner=user" do
      let!(:category) { create(:category) }
      let!(:item) { create(:item) }
      let(:item_name) { item.name }
      let(:user) { create(:user) }
      example_request 'Getting item create action request' do    
        expect { Item.create(name: :item_name, owner: user, category: category) }.to change{ Item.count }.by(1)
      end
    end

    post "/items?description=item_description" do
      let!(:item) { create(:item)}
      let(:item_description) { item.description }
      example_request 'Getting item create action request without required params' do
        expect(status).to eq(422)
      end
    end 

    delete '/items/:item_id' do
      let!(:item) { create(:item) }
      let(:item_id) { item.id }
      example 'Getting item destroy action request' do
        expect { do_request }.to change{ Item.count }.by(-1)
      end
    end  
  end
