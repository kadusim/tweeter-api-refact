class TweetsApi
  attr_reader :username

  def initialize
    @searched_tweets = []
    @username        = get_user_name
  end

  def search
    get_tweets_api
  end

  private

  def get_tweets_api
    response_tweets_hash = RestClient.get 'http://tweeps.locaweb.com.br/tweeps', {Username: @username}
    JSON.parse(response_tweets_hash)
  end

  def get_user_name
    ENV['HTTP_USERNAME']
  end

end
