class SupportTweetsController < ApplicationController

  def most_relevants
    tweets_most_relevants = FormatTweetsMostRelevants.new.call(tweets)
    json_response(tweets_most_relevants)
  end

  def most_mentions
    tweets_most_mentions = FormatTweetsMostMentions.new.call(tweets)
    json_response(tweets_most_mentions)
  end

  private

  def tweets
    TweetsService.call
  end

end
