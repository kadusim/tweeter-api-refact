class FormatTweetsMostMentions
  include FormatTweets

  def call(tweets)
    format(tweets)
  end

  private

  def get_formated_tweets
    sort_tweets_fields.sorted_tweets.each do |current_tweet|
      current_tweet_screen_name = current_tweet[:screen_name]
      select_tweets_for_screen_name(current_tweet_screen_name)
    end
    format_response_formated_tweets
  end

  def format_response_formated_tweets
    if @formated_tweets.any?
      @formated_tweets = @formated_tweets.uniq
    else
      [{message: 'No tweets most mentions found on Tweeter'}]
    end
  end

  def select_tweets_for_screen_name(current_tweet_screen_name)
      tweets_for_screen_name = {}

      tweets_for_screen_name["#{current_tweet_screen_name}"] =
        sort_tweets_fields.sorted_tweets.select do |tweet_for_screen_name|
          tweet_for_screen_name[:screen_name] == current_tweet_screen_name
        end

      add_to_most_mentions_array(tweets_for_screen_name)
  end

  def add_to_most_mentions_array(tweets_for_screen_name)
    @formated_tweets << tweets_for_screen_name
  end

end
