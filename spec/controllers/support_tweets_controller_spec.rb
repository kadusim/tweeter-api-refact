require 'rails_helper'

RSpec.describe SupportTweetsController, type: :controller do

  describe 'GET #most_relevants' do
    it 'returns http success' do
      get :most_relevants
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #most_mentions' do
    it 'returns http success' do
      get :most_mentions
      expect(response).to have_http_status(200)
    end
  end

end
