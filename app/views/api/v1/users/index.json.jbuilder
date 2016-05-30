json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :phone, :current_title, :current_employer, :graduation_date, :cohort_id, :admin
  json.url user_url(user, format: :json)
  json.friendly_grad_date user.friendly_grad_date
  json.cohort user.cohort
  json.full_name user.full_name
end