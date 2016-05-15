class User < ActiveRecord::Base

  belongs_to :cohort

  validates :first_name, :last_name, :email, presence: true
  validates :cohort_id, :graduation_date, presence: true, unless: "admin"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
