require 'rails_helper'
require 'spec_helper'


describe 'Items API', type: :request do
  let!(:city)     { create(:city) }
  let!(:user)     { create(:user, city_id: city.id) }
  let!(:item)     { create(:item, owner_id: user.id) }
 
  describe 'GET /items' do
    before { get "/items"}

    context 'items exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns all items' do
        json = JSON.parse(response.body)
        expect(json['items'].count).to eq(Item.count)
      end
    end
  end

  describe 'GET /items/:id' do 
    context 'item not exists' do
      before { get '/items/wrong_id' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns error message' do
        json = JSON.parse(response.body)
        expect(json['items']['message']).to be_present
      end
    end

    context 'item exists' do
      before { get "/items/#{item.id}" }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'return item' do
        json = JSON.parse(response.body)
        expect(json.count).to eq(1)
      end
    end
  end
  
  describe 'POST /items' do
    context 'valid params' do
      before { post "/items?name=#{item.name}&description=#{item.description}" }

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
      it 'item create action increases Item.count by 1' do
        expect { Item.create(name: item.name, description: item.description, owner: user) }.to change(Item, :count).from(Item.count).to(Item.count + 1)
      end
    end

    context 'invalid params' do
      before { post "/items?description=#{item.description}" }
      
      it 'return status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns error message' do
        json = JSON.parse(response.body)
        expect(json['items']['message']).to be_present
      end
    end
  end

  describe 'DELETE /items/:id' do
    
    it 'item destroy action reduces Item.count by 1' do
      expect { item.destroy }.to change(Item, :count).from(Item.count).to(Item.count - 1)
    end
  end
end