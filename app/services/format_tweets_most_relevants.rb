class FormatTweetsMostRelevants
  include FormatTweets

  def call(tweets)
    format(tweets)
  end

  private

  def get_formated_tweets
    format_response_formated_tweets
  end

  def format_response_formated_tweets
    if sort_tweets_fields.sorted_tweets.any?
      @formated_tweets = sort_tweets_fields.sorted_tweets
    else
      [{message: 'No tweets most relevants found on Tweeter'}]
    end
  end

end
