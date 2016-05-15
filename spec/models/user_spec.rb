require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do

    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "is invalid without first_name" do
      user = FactoryGirl.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without last_name" do
      user = FactoryGirl.build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
      
    it "is invalid without email" do
      user = FactoryGirl.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without graduation_date" do
      user = FactoryGirl.build(:user, graduation_date: nil)
      user.valid?
      expect(user.errors[:graduation_date]).to include("can't be blank")
    end

    it "is invalid without :cohort_id if user is graduate" do
      user = FactoryGirl.build(:user, graduation_date: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

  end
end
