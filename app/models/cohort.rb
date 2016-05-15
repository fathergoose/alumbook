class Cohort < ActiveRecord::Base

  has_many :users

  validates :name, :campus, :instructor, :cohort_date, presence: true

end
