require 'rails_helper'

RSpec.describe "Routes", type: :request do
  describe "GET /routes" do
    it "works! (now write some real specs)" do
      get routes_index_path
      expect(response).to have_http_status(200)
    end
  end
end
