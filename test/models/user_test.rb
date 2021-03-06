# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    # @user = User.new(username: "elijah", email: "elijah@gmail.com", password: "12345")
    @user = User.new(username: 'yeah', email: 'test@gmail.com', password: '12345', password_comfirmation: '12345')
  end

  test 'should be valid' do
    assert @user.valid?
  end
end
