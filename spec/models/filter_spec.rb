require 'rails_helper'

describe Filter, 'association' do
  it { should belong_to(:category) }
  it { should have_many(:options) }
end
