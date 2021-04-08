json.extract! tweet, :id, :content, :user_id, :origin_tweet, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
