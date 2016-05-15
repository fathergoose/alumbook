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

    it "is invalid without graduation_date if user is graduate" do
      user = FactoryGirl.build(:user, graduation_date: nil)
      user.valid?
      expect(user.errors[:graduation_date]).to include("can't be blank")
    end

    it "is valid without graduation_date if user is admin" do
      user = FactoryGirl.build(:user, graduation_date: nil, admin: true)
      expect(user).to be_valid
    end

    it "is invalid without :cohort_id if user is graduate" do
      user = FactoryGirl.build(:user, cohort_id: nil)
      user.valid?
      expect(user.errors[:cohort_id]).to include("can't be blank")
    end

    it "is valid without :cohort_id if user is admin" do
      user = FactoryGirl.build(:user, cohort_id: nil, admin: true)
      expect(user).to be_valid
    end

    it "invalidates non-email addresses with regex" do
      user = FactoryGirl.build(:user, email: "not_a_real_address.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "validates email address with regex" do
      user = FactoryGirl.build(:user, email: "looks.real@address.com")
      expect(user).to be_valid
    end

    it "has a #full_name method that returns capitalized full name" do
      user = FactoryGirl.build(:user)
      full_name = user.first_name.capitalize + ' ' + user.last_name.capitalize
      expect(full_name).to eq(user.full_name)
    end
      


  end
end
