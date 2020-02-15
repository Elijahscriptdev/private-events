# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(username: 'elijah', email: 'elijah@email.com', password: '1235') }
  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end
  it 'is not valid without a name' do
    @user.username = nil
    expect(@user).to_not be_valid
  end
  it 'is not valid without a email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end
end
