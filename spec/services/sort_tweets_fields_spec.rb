require 'rails_helper'

RSpec.describe SortTweetsFields do

  before(:each) do
    tweets = TweetsService.new.call
    @filter_tweets_fields = FilterTweetsFields.new(tweets)
    @filter_tweets_fields.filter_tweets_by_locaweb_user_id
  end

  context 'when sort tweets fields' do

    before(:each) do
      @sort_tweets_fields = SortTweetsFields.new(@filter_tweets_fields)
      @sort_tweets_fields.sort_tweets
    end

    it 'returns of sorted_tweets must be an array' do
      expect(@sort_tweets_fields.sorted_tweets).to be_an_instance_of(Array)
    end

    it 'returns all keys' do
      @sort_tweets_fields.sorted_tweets.each do |tweet|
        expect(tweet).to have_key(:screen_name)
        expect(tweet).to have_key(:followers_count)
        expect(tweet).to have_key(:retweet_count)
        expect(tweet).to have_key(:favorite_count)
        expect(tweet).to have_key(:text)
        expect(tweet).to have_key(:created_at)
        expect(tweet).to have_key(:profile_link)
        expect(tweet).to have_key(:tweet_link)
      end
    end

    it 'returns tweets sorted by followers_count, retweet_count and favorite_count' do
      sorted_tweets_mock =
        [
          {
            screen_name: 'locaweb_was_menthioned_1',
            followers_count: 904,
            retweet_count: 10_000,
            favorite_count: 187,
            text: '@locaweb menthioned and not reply to locaweb post with 10_000 retweet_count',
            created_at: 'Mon Sep 24 03:35:21 +0000 2012',
            profile_link: 'https://twitter.com/locaweb_was_menthioned_1',
            tweet_link: 'https://twitter.com/locaweb_was_menthioned_1/status/1'
          },
          {
            screen_name: 'locaweb_was_menthioned_11',
            followers_count: 904,
            retweet_count: 0,
            favorite_count: 10_000,
            text: '@locaweb menthioned and not reply to locaweb post with 10_000 favorite_count',
            created_at: 'Mon Sep 24 03:35:21 +0000 2012',
            profile_link: 'https://twitter.com/locaweb_was_menthioned_11',
            tweet_link: 'https://twitter.com/locaweb_was_menthioned_11/status/11'
          },
          {
            screen_name: 'locaweb_was_menthioned_1',
            followers_count: 904,
            retweet_count: 0,
            favorite_count: 188,
            text: '@locaweb menthioned and not reply to locaweb post',
            created_at: 'Mon Sep 24 03:35:21 +0000 2012',
            profile_link: 'https://twitter.com/locaweb_was_menthioned_1',
            tweet_link: 'https://twitter.com/locaweb_was_menthioned_1/status/1'
          },
          {
            screen_name: 'locaweb_was_menthioned_11',
            followers_count: 904,
            retweet_count: 0,
            favorite_count: 187,
            text: '@locaweb menthioned and not reply to locaweb post',
            created_at: 'Mon Sep 24 03:35:21 +0000 2012',
            profile_link: 'https://twitter.com/locaweb_was_menthioned_11',
            tweet_link: 'https://twitter.com/locaweb_was_menthioned_11/status/11'
          }
        ]

      expect(sorted_tweets_mock).to eq(@sort_tweets_fields.sorted_tweets)
    end

  end

end
