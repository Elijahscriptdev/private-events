# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:attended_events) }
    it { should have_many(:user_events) }
    it { should have_many(:events) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end
end

# RSpec.describe User, type: :model do
#   before(:each) { @user = User.new(username: 'elijah', email: 'elijah@email.com', password: '1235') }
#   it { should have_many(:events) }

#   it "has many events" do
#     expect(User).to have_many(:events)
#   end
#   it 'is valid with valid attributes' do
#     expect(@user).to be_valid
#   end
#   it 'is not valid without a name' do
#     @user.username = nil
#     expect(@user).to_not be_valid
#   end
#   it 'is not valid without a email' do
#     @user.email = nil
#     expect(@user).to_not be_valid
#   end

# end
