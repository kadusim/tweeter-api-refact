require 'rails_helper'

RSpec.describe FormatTweetsMostRelevants do

  before(:each) do
    @tweets = TweetsService.new.call
  end

  context 'when format tweets most relevants' do

    before(:each) do
      format_tweets_most_relevants = FormatTweetsMostRelevants.new.call(@tweets)
      @formated_tweets = JSON.parse(format_tweets_most_relevants)
    end

    it 'returns of formated_tweets must be an array' do
      expect(@formated_tweets).to be_an_instance_of(Array)
    end

    it 'returns inside array of formated_tweets must be an hash' do
      expect(@formated_tweets.first).to be_an_instance_of(Hash)
    end

    it 'returns all keys' do
      @formated_tweets.each do |tweet|
        expect(tweet).to have_key('screen_name')
        expect(tweet).to have_key('followers_count')
        expect(tweet).to have_key('retweet_count')
        expect(tweet).to have_key('favorite_count')
        expect(tweet).to have_key('text')
        expect(tweet).to have_key('created_at')
        expect(tweet).to have_key('profile_link')
        expect(tweet).to have_key('tweet_link')
      end
    end

  end

  context 'when no have any Tweets on Tweet Api return' do

    before(:each) do
      format_tweets_most_relevants = FormatTweetsMostRelevants.new.call(Hash.new)
      @formated_tweets = JSON.parse(format_tweets_most_relevants)
    end

    it 'returns of formated_tweets must be an array' do
      expect(@formated_tweets).to be_an_instance_of(Array)
    end

    it 'returns inside array of formated_tweets must be an hash' do
      expect(@formated_tweets.first).to be_an_instance_of(Hash)
    end

    it 'returns message No tweets most relevants found on Tweeter' do
      expect(@formated_tweets.first['message']).to match(/No tweets most relevants found on Tweeter/)
    end

  end

end
