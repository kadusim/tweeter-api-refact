require 'rails_helper'

RSpec.describe FormatTweetsMostMentions do

  before(:each) do
    @tweets = TweetsService.new.call
  end

  context 'when format tweets most mentions' do

    before(:each) do
      format_tweets_most_mentions = FormatTweetsMostMentions.new.call(@tweets)
      @formated_tweets = JSON.parse(format_tweets_most_mentions)
    end

    it 'returns of formated_tweets must be an array' do
      expect(@formated_tweets).to be_an_instance_of(Array)
    end

    it 'returns inside array of formated_tweets must be an hash' do
      expect(@formated_tweets.first).to be_an_instance_of(Hash)
    end

    it 'returns user screen name same tweets user screen name and return all keys' do
      @formated_tweets.each do |user|

        user.keys.each do |user_screen_name|

          user[user_screen_name].each do |tweet|
            expect(user_screen_name).to eq(tweet['screen_name'])
            expect_return_all_keys_from(tweet)
          end

        end

      end
    end

    def expect_return_all_keys_from(tweet)
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


  context 'when no have any Tweets on Tweet Api return' do

    before(:each) do
      format_tweets_most_mentions = FormatTweetsMostMentions.new.call(Hash.new)
      @formated_tweets = JSON.parse(format_tweets_most_mentions)
    end

    it 'returns of formated_tweets must be an array' do
      expect(@formated_tweets).to be_an_instance_of(Array)
    end

    it 'returns inside array of formated_tweets must be an hash' do
      expect(@formated_tweets.first).to be_an_instance_of(Hash)
    end

    it 'returns message No tweets most mentions found on Tweeter' do
      expect(@formated_tweets.first['message']).to match(/No tweets most mentions found on Tweeter/)
    end

  end

end
