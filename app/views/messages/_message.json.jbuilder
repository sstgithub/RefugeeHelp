json.extract! message, :id, :lat, :long, :user_type, :category_name, :created_at, :updated_at
json.url message_url(message, format: :json)