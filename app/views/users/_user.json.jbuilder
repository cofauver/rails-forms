json.extract! user, :id, :name, :email, :marketing, :articles, :digest, :created_at, :updated_at
json.url user_url(user, format: :json)
