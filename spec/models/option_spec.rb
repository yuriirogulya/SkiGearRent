require 'rails_helper'

describe Option, 'association' do
  it { should belong_to(:filter) }
  it { should have_and_belong_to_many(:items) }
end
