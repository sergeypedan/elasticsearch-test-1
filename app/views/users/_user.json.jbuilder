json.extract! user, :id, :first_name, :last_name, :date_of_birth, :published, :created_at, :updated_at
json.url user_url(user, format: :json)
