require 'rails_helper'

RSpec.describe Cohort, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #validates :name, :campus, :instructor, :cohort_date, presence: true

  
    it "has a valid factory" do
      expect(FactoryGirl.build(:cohort)).to be_valid
    end

end
