class User < ActiveRecord::Base

  belongs_to :cohort

  validates :first_name, :last_name, :email, :graduation_date, :cohort_id, :user_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def type_name
    if admin
      "Admin"
    else 
      "Graduate"
    end
  end
end
