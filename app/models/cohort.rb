class Cohort < ActiveRecord::Base

  has_many :users

  validates :name, :campus, :instructor, :date, presence: true

end
