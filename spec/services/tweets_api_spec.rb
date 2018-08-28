require 'rails_helper'

RSpec.describe TweetsApi do

  context 'when instancied tweeter class for get a searched tweets' do

    before(:each) do
      @tweets = TweetsApi.new
    end

    it 'returns JSON with tweets fields requireds' do
      expect(@tweets.search).to have_key('statuses')

      @tweets.search['statuses'].each do |tweet|
        expect(tweet).to have_key('id_str')

        expect(tweet).to have_key('entities')
        expect(tweet['entities']).to have_key('user_mentions')

        expect(tweet).to have_key('in_reply_to_user_id_str')
        expect(tweet).to have_key('text')
        expect(tweet).to have_key('retweet_count')
        expect(tweet).to have_key('favorite_count')

        expect(tweet).to have_key('user')
        expect(tweet['user']).to have_key('followers_count')
        expect(tweet['user']).to have_key('screen_name')
      end

    end

    it 'returns of search must be an hash' do
      expect(@tweets.search).to be_an_instance_of(Hash)
    end

  end

end
