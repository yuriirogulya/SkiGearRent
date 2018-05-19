require 'rails_helper'

describe Booking, 'validation' do
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end

describe Booking, 'association' do
  it { should belong_to(:item) }
  it { should belong_to(:renter) }
end


