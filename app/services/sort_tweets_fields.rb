class SortTweetsFields
  attr_reader :sorted_tweets, :tweets

  def initialize(filter_tweets_fields)
    @tweets        = filter_tweets_fields.filtered_tweets
    @sorted_tweets = []
  end

  def sort_tweets
    @sorted_tweets = tweets.sort_by { |tweet| sort_by_key(tweet) }
  end

  private

  def sort_by_key(tweet)
    [
      -tweet[:followers_count],
      -tweet[:retweet_count],
      -tweet[:favorite_count]
    ]
  end
end
