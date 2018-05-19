require 'rails_helper'

describe City, 'validation' do
  it { should validate_presence_of(:name) }
end

describe City, 'association' do
  it { should have_many(:users) }
  it { should have_many(:items).through(:users) }
end


