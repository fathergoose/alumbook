json.extract! @user, :id, :first_name, :last_name, :email, :current_title, :current_employer, :graduation_date, :cohort_id, :user_type, :created_at, :updated_at

json.full_name @user.full_name
json.friendly_grad_date @user.friendly_grad_date
json.cohort @user.cohort
