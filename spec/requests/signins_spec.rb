require 'rails_helper'

RSpec.describe "Signins", type: :request do
  describe "GET /signin" do
    it "works! (now write some real specs)" do
      get signin_path
      expect(response).to have_http_status(200)
    end
  end
end
