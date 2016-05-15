class Graduate < ActiveRecord::Base
  validates :first_name, :last_name, :email, :graduation_date, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
