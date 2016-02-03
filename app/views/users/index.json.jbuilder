json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :first_name, :last_name, :is_active, :is_delete_account,:company_id
  json.extract! user.company, :company_name, :description
  json.url user_url(user, format: :json)
end
