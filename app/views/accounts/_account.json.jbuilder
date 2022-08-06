json.extract! account, :id, :username, :firsname, :lastname, :listing_id, :created_at, :updated_at
json.url account_url(account, format: :json)
