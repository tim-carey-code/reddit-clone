json.extract! subreddit, :id, :name, :sub_description, :created_at, :updated_at
json.url subreddit_url(subreddit, format: :json)
