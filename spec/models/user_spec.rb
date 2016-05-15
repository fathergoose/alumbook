require 'rails_helper'

RSpec.describe User, type: :model do
  describe Graduate do

    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "is invalid without first_name" do
      user = FactoryGirl.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

  end
end
