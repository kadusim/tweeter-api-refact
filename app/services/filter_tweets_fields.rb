class FilterTweetsFields
  attr_reader :filtered_tweets, :tweets

  TWEETER_LINK          = 'https://twitter.com/'
  TWEET_LINK_COMPLEMENT = '/status/'
  LOCAWEB_USER_ID       = '42'

  def initialize(tweets)
    @tweets          = tweets
    @filtered_tweets = []
  end

  def filter_tweets_by_locaweb_user_id
    if tweets["statuses"]
      statuses = tweets["statuses"]

      statuses.each do |status|
        select_fields_for_current(status) if locaweb_user_id_exists_in?(status)
      end

    end
  end

  private

  def select_fields_for_current(status)
    fields_current_status = {}

    fields_current_status[:screen_name]     = select_screen_name_user(status)
    fields_current_status[:followers_count] = select_followers_count_user(status)

    fields_current_status[:retweet_count]   = select_retweet_count(status)
    fields_current_status[:favorite_count]  = select_favorite_count(status)
    fields_current_status[:text]            = select_text(status)
    fields_current_status[:created_at]      = select_created_at(status)

    fields_current_status[:profile_link]    = select_profile_link(status)
    fields_current_status[:tweet_link]      = select_tweet_link(status)

    add_to_filtered_fields(fields_current_status)
  end

  def locaweb_user_id_exists_in?(status)
    size_user_mentions = status['entities']['user_mentions'].size

    if size_user_mentions > 0
      user_mentions = status['entities']['user_mentions']

      user_mentions.each do |user_mention|
        return true if locaweb_mentioned(user_mention) && non_reply_locaweb_post(status)
      end

    end
    false
  end

  def locaweb_mentioned(user_mention)
    user_mention['id_str'] == LOCAWEB_USER_ID
  end

  def non_reply_locaweb_post(status)
    status['in_reply_to_user_id_str'] != LOCAWEB_USER_ID
  end

  def select_screen_name_user(status)
    status['user']['screen_name']
  end

  def select_followers_count_user(status)
    status['user']['followers_count']
  end

  def select_retweet_count(status)
    status['retweet_count']
  end

  def select_favorite_count(status)
    status['favorite_count']
  end

  def select_text(status)
    status['text']
  end

  def select_created_at(status)
    status['created_at']
  end

  def select_id_str(status)
    status['id_str']
  end

  def select_profile_link(status)
    TWEETER_LINK + select_screen_name_user(status)
  end

  def select_tweet_link(status)
    TWEETER_LINK + select_screen_name_user(status) + TWEET_LINK_COMPLEMENT + select_id_str(status)
  end

  def add_to_filtered_fields(fields_current_status)
    filtered_tweets << fields_current_status
  end
end
