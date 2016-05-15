json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :current_title, :current_employer, :graduation_date, :cohort_id, :user_type
  json.url user_url(user, format: :json)
end