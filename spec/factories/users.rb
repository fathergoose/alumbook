# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    current_title "MyString"
    current_employer "MyString"
    graduation_date "2016-05-15"
    cohort_id 1
    user_type 1
  end
end
