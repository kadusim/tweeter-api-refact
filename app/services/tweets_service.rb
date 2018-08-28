class TweetsService < ApplicationService
  attr_reader :tweets

  def initialize
    @tweets = TweetsApi.new
  end

  def call
    @tweets.search
  end

end
