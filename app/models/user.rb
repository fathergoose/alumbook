class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :graduation_date, :cohort_id, :user_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
