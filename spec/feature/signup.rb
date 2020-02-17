# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  # Add this
  login_user

  let(:valid_attributes) do
    { title: 'Test title!', description: 'This is a test description', status: 'draft' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Article.create! valid_attributes
      get :index, params: {}, session: valid_session

      # Make sure to swap this as well
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
      # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
    end
  end
end
