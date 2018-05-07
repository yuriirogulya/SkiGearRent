require 'rails_helper'

describe 'Items API', type: :request do
  let!(:city)    { create(:city) }
  let!(:user)    { create(:user, city_id: city.id) }
  let!(:items)   { create_list(:item, 10, owner_id: user.id) }
  let(:item_id)  { items.id }

  describe 'GET /items' do
    before { get "/items"}
    
    context 'items exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'items not exists' do
    let(:item_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end