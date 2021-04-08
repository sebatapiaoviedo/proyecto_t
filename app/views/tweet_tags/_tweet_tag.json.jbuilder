json.extract! tweet_tag, :id, :tweet_id, :tag_id, :created_at, :updated_at
json.url tweet_tag_url(tweet_tag, format: :json)
