require 'rails_helper'

RSpec.describe FilterTweetsFields do

  before(:each) do
    @tweets = TweetsService.new.call
  end

  context 'when filter tweets fields' do

    before(:each) do
      @filter_tweets_fields = FilterTweetsFields.new(@tweets)
      @filter_tweets_fields.filter_tweets_by_locaweb_user_id
    end

    it 'returns of filter_tweets_by_locaweb_user_id must be an array' do
      expect(@filter_tweets_fields.filtered_tweets).to be_an_instance_of(Array)
    end

    it 'returns inside array of filter_tweets_by_locaweb_user_id must be an hash' do
      expect(@filter_tweets_fields.filtered_tweets.first).to be_an_instance_of(Hash)
    end

    it 'returns all keys' do
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:screen_name)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:followers_count)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:retweet_count)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:favorite_count)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:text)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:created_at)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:profile_link)
      expect(@filter_tweets_fields.filtered_tweets.first).to have_key(:tweet_link)
    end

    it 'returns only tweets when locaweb was menthioned' do
      expect(@filter_tweets_fields.filtered_tweets.size).to eq(4)
      expect(@filter_tweets_fields.filtered_tweets.to_s).to include('locaweb_was_menthioned_1')
      expect(@filter_tweets_fields.filtered_tweets.to_s).to include('locaweb_was_menthioned_11')
    end

    it 'not returns tweets when locaweb was menthioned but is reply to locaweb post' do
      expect(@filter_tweets_fields.filtered_tweets.to_s).to_not include('locaweb_was_menthioned_but_is_reply_to_locaweb_post')
    end

    it 'not returns tweets when locaweb was not menthioned' do
      expect(@filter_tweets_fields.filtered_tweets.to_s).to_not include('locaweb_was_not_menthioned')
    end

  end

end
