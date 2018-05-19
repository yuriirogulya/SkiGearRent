require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Items' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  let!(:category) { create(:category)}
  let!(:city) { create(:city) }
  let!(:user) { create(:user) }
  let!(:item) { create(:item, category_id: 1) }
  let!(:items) { create_list(:item, 10) }

  context 'valid params' do
    get '/items/:items_id' do
      let(:items_id) { item.id }
      example_request 'Getting item request by id' do
        expect(status).to eq(200)
        expect(response_body).to eq(item.to_json)
      end        
    end

    get '/items' do
      let(:per_page) { 3 }
      parameter :page, 'items page number'
      parameter :per_page, 'Number of items shown on single page (default 10)'
      example_request 'Getting all items request' do
        expect(status).to eq(200)
        json = JSON.parse(response_body)
        expect(json.count).to eq(3)
      end
    end

    get '/items' do
      let(:page) { 1 }
      let(:per_page) { 10 }
      example_request 'Getting 1st page with 10 items per page request' do
        json = JSON.parse(response_body)
        expect(json.count).to eq(10)
      end
    end
  
    post "/items?name=item_name&category_id=category_idd" do
      let(:item_name) { item.name }
      example_request 'Getting item create action request' do    
        expect { Item.create(name: :item_name, 
                            description: :item_description, 
                            owner: user, category_id: 1) }.to change(Item, :count).by(1)
      end
    end

    delete '/items/:item_id' do
      let(:item_id) { item.id }
      example 'Getting item destroy action request' do
        expect { do_request }.to change { Item.count }.by(-1)
      end
    end

  end
  
  context 'invalid params' do
    get '/items/:wrong_id' do
      let(:wrong_id) { 0 }
      example 'Getting item request with wrong id' do
        expect { do_request }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end

    get '/items?page=100' do
      example_request 'Getting items request with wrong page' do
        expect(response_body).to eq("[]")
      end
    end

    post "/items?description=item_description" do
      let(:item_description) { item.description }
      example_request 'Getting item create action request without name' do
        expect(status).to eq(422)
      end
    end   
  end
end