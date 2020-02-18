# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:user_events) }
    it { should have_many(:attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:event_name) }
    it { should validate_presence_of(:event_date) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
  end
end

