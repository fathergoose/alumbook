json.array!(@graduates) do |graduate|
  json.extract! graduate, :id, :first_name, :last_name, :email, :phone, :current_title, :current_employer, :graduation_date
  json.url graduate_url(graduate, format: :json)
end
