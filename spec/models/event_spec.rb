# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) { @user = User.new(id: 1, username: 'jay', email: 'jay@email.com', password: '1235') }
  before(:each) { @event = @user.events.build(event_name: 'event', location: 'example', event_date: '02/11/2020', description: 'Football') }

  it 'is valid with valid attributes' do
    expect(@event).to be_valid
  end

  it 'is not valid without a event_name' do
    @event.event_name = nil
    expect(@event).to_not be_valid
  end

  it 'is not valid without a location' do
    @event.location = nil
    expect(@event).to_not be_valid
  end
  it 'is not valid withour a event_date' do
    @event.event_date = nil
    expect(@event).to_not be_valid
  end

  it 'is passed events' do
    @event.save
    expect(Event.past.include?(@event)).to be true
  end
  it 'is upcoming events' do
    expect(Event.upcoming.include?(@event)).to be false
  end
end
