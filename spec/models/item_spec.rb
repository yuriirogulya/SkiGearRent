require 'rails_helper'

describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }

  # it 'has a valid item factory' do
  #   expect(FactoryBot.build :item).to be_valid
  # end

  # it 'is invalid without name' do
  #   expect(FactoryBot.build :item, name: nil).not_to be_valid
  # end

end