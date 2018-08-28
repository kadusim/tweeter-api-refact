module FormatTweets
  attr_reader :filter_tweets_fields, :sort_tweets_fields, :formated_tweets

  def format(tweets)
    @filter_tweets_fields = FilterTweetsFields.new(tweets)
    filter_tweets

    @sort_tweets_fields   = SortTweetsFields.new(filter_tweets_fields)
    sort_tweets

    @formated_tweets = []
    get_formated_tweets.to_json
  end

  private

  def get_formated_tweets
    raise ExceptionHandler::MethodNotImplementedError, "Not implemented for #{self}, you need implemet this method for custom formated_tweets return"
  end

  def filter_tweets
    filter_tweets_fields.filter_tweets_by_locaweb_user_id
  end

  def sort_tweets
    sort_tweets_fields.sort_tweets
  end

end
