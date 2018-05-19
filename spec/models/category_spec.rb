require 'rails_helper'

describe Category, 'validation' do
  it { should validate_presence_of(:name) }
end

describe Category, 'association' do
  it { should have_many(:items) }
  it { should have_many(:filters) }
end

