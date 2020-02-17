# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  it { should route(:get, '/events').to(action: :index) }
  it { should route(:get, '/events/1').to(action: :show, id: 1) }
end
