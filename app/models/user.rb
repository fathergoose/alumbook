class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :cohort

  validates :first_name, :last_name, :email, presence: true
  validates :cohort_id, :graduation_date, presence: true, unless: "admin"

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def full_name
   "#{first_name.capitalize} #{last_name.capitalize}"     end

  def friendly_grad_date
    if graduation_date != nil
      graduation_date.strftime("%b %d, %Y")
    end
  end
  
end
