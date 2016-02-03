json.extract! @user, :id, :username, :password, :first_name, :last_name, :is_active, :is_delete_account, :created_at, :updated_at, :company_id
json.extract! @user.company, :company_name, :description
