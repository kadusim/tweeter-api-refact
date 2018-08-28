require 'rails_helper'

RSpec.describe 'Request Most Relevants', type: :request do

  describe 'GET /api/most_relevants' do

    before {
      get '/api/most_relevants'
    }

    context 'when there are tweets locaweb mention' do

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns json' do
        expect(response.headers['Content-Type']).to eq('application/json; charset=utf-8')
      end

      it 'returns all keys for tweets' do
        tweets_response_array = JSON.parse(response.body)

        tweets_response_array.each do |tweet_field|
          expect(tweet_field).to have_key('screen_name')
          expect(tweet_field).to have_key('followers_count')
          expect(tweet_field).to have_key('retweet_count')
          expect(tweet_field).to have_key('favorite_count')
          expect(tweet_field).to have_key('text')
          expect(tweet_field).to have_key('created_at')
          expect(tweet_field).to have_key('profile_link')
          expect(tweet_field).to have_key('tweet_link')
        end

      end

      it 'returns tweets ordered and locaweb was menthioned' do
        tweets_response_array = JSON.parse(response.body)

        sorted_tweets_mock =
          [
            {
              'screen_name' => 'locaweb_was_menthioned_1',
              'followers_count' => 904,
              'retweet_count' => 10000,
              'favorite_count' => 187,
              'text' => '@locaweb menthioned and not reply to locaweb post with 10_000 retweet_count',
              'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
              'profile_link' => 'https://twitter.com/locaweb_was_menthioned_1',
              'tweet_link' => 'https://twitter.com/locaweb_was_menthioned_1/status/1'
            },
            {
              'screen_name' => 'locaweb_was_menthioned_11',
              'followers_count' => 904,
              'retweet_count' => 0,
              'favorite_count' => 10000,
              'text' => '@locaweb menthioned and not reply to locaweb post with 10_000 favorite_count',
              'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
              'profile_link' => 'https://twitter.com/locaweb_was_menthioned_11',
              'tweet_link' => 'https://twitter.com/locaweb_was_menthioned_11/status/11'
            },
            {
              'screen_name' => 'locaweb_was_menthioned_1',
              'followers_count' => 904,
              'retweet_count' => 0,
              'favorite_count' => 188,
              'text' => '@locaweb menthioned and not reply to locaweb post',
              'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
              'profile_link' => 'https://twitter.com/locaweb_was_menthioned_1',
              'tweet_link' => 'https://twitter.com/locaweb_was_menthioned_1/status/1'
            },
            {
              'screen_name' => 'locaweb_was_menthioned_11',
              'followers_count' => 904,
              'retweet_count' => 0,
              'favorite_count' => 187,
              'text' => '@locaweb menthioned and not reply to locaweb post',
              'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
              'profile_link' => 'https://twitter.com/locaweb_was_menthioned_11',
              'tweet_link' => 'https://twitter.com/locaweb_was_menthioned_11/status/11'
            }
          ]

        expect(sorted_tweets_mock).to eq(tweets_response_array)

      end

    end

  end

end
