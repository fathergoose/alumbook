require 'rails_helper'

RSpec.describe Graduate, type: :model do
  describe Graduate do
    it "has a valid factory" do
      expect(FactoryGirl.build(:graduate)).to be_valid
    end

    

  end
end
