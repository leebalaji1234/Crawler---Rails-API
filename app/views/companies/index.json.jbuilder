json.array!(@companies) do |company|
  json.extract! company, :id, :company_name, :description
  json.url company_url(company, format: :json)
end
