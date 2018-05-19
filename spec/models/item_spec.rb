require 'rails_helper'

  describe Item, 'validation' do
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:name) }
  end

  describe Item, 'association' do
    it { should have_many(:reviews) }
    it { should have_many(:bookings) }
    it { should have_and_belong_to_many(:options) }
    it { should belong_to(:owner) }
    it { should belong_to(:category) }
  end
