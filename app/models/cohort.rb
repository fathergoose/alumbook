class Cohort < ActiveRecord::Base
  validates :name, :campus, :instructor, :date, presence: true

end
