RSpec.configure do |config|
  config.before(:each) do

  stub_request(:get, 'http://tweeps.locaweb.com.br/tweeps').

    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'tweeps.locaweb.com.br',
      'User-Agent'=>'rest-client/2.1.0.rc1 (darwin17.5.0 x86_64) ruby/2.4.1p111',
      'Username'=>'kadu_simoes_1@hotmail.com'
      }).

    to_return(status: 200, body:
      '{
        "statuses": [
          {
            "created_at": "Mon Sep 24 03:35:21 +0000 2012",
            "id_str": "1",
            "entities": {
              "user_mentions": [
                {
                  "id_str": "42"
                }
              ]
            },
            "in_reply_to_user_id_str": "",
            "text": "@locaweb menthioned and not reply to locaweb post",
            "retweet_count": 0,
            "favorite_count": 188,
            "user": {
              "followers_count": 904,
              "screen_name": "locaweb_was_menthioned_1"
            }
          },
          {
            "created_at": "Mon Sep 24 03:35:21 +0000 2012",
            "id_str": "1",
            "entities": {
              "user_mentions": [
                {
                  "id_str": "42"
                }
              ]
            },
            "in_reply_to_user_id_str": "",
            "text": "@locaweb menthioned and not reply to locaweb post with 10_000 retweet_count",
            "retweet_count": 10000,
            "favorite_count": 187,
            "user": {
              "followers_count": 904,
              "screen_name": "locaweb_was_menthioned_1"
            }
          },
          {
            "created_at": "Mon Sep 24 03:35:21 +0000 2012",
            "id_str": "11",
            "entities": {
              "user_mentions": [
                {
                  "id_str": "42"
                }
              ]
            },
            "in_reply_to_user_id_str": "",
            "text": "@locaweb menthioned and not reply to locaweb post",
            "retweet_count": 0,
            "favorite_count": 187,
            "user": {
              "followers_count": 904,
              "screen_name": "locaweb_was_menthioned_11"
            }
          },
          {
            "created_at": "Mon Sep 24 03:35:21 +0000 2012",
            "id_str": "11",
            "entities": {
              "user_mentions": [
                {
                  "id_str": "42"
                }
              ]
            },
            "in_reply_to_user_id_str": "",
            "text": "@locaweb menthioned and not reply to locaweb post with 10_000 favorite_count",
            "retweet_count": 0,
            "favorite_count": 10000,
            "user": {
              "followers_count": 904,
              "screen_name": "locaweb_was_menthioned_11"
            }
          },
          {
            "created_at": "Mon Sep 24 03:35:21 +0000 2012",
            "id_str": "2",
            "entities": {
              "user_mentions": [
                {
                  "id_str": "42"
                }
              ]
            },
            "in_reply_to_user_id_str": "42",
            "text": "@locaweb menthioned but is reply to locaweb post",
            "retweet_count": 0,
            "favorite_count": 187,
            "user": {
              "followers_count": 904,
              "screen_name": "locaweb_was_menthioned_but_is_reply_to_locaweb_post"
            }
          },
          {
            "created_at": "Mon Sep 24 03:35:21 +0000 2012",
            "id_str": "3",
            "entities": {
              "user_mentions": [
                {
                  "id_str": "45"
                }
              ]
            },
            "in_reply_to_user_id_str": "",
            "text": "@locaweb not menthioned",
            "retweet_count": 0,
            "favorite_count": 187,
            "user": {
              "followers_count": 904,
              "screen_name": "locaweb_was_not_menthioned"
            }
          }
        ]
      }', headers: {})

  end
end
