class User < ActiveRecord::Base

  belongs_to :cohort

  validates :first_name, :last_name, :email, :graduation_date, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :cohort_id, presence: true unless user.admin

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
