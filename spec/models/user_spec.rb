require 'rails_helper'

describe User do
  let(:user) { FactoryBot.create :user }

  it 'has many items' do
    expect(user).to respond_to :items
  end
  # it "has a valid user factory" do
  #   expect(FactoryBot.build :user).to be_valid
  # end
  it 'is invalid without an email' do
    expect(FactoryBot.build :user, email: nil).not_to be_valid
  end
  it 'is valid with good email' do
    expect(FactoryBot.build :user, email: user.email).to be_valid
  end
  it 'has unique username' do
    expect(FactoryBot.build :user, username: user.username).not_to be_valid
  end
  it 'has username without whitespaces' do
    expect(FactoryBot.build :user, username: 'hello world').not_to be_valid
  end
  
end