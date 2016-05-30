# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    phone '773-555-5555'
    current_title {Faker::Name.title}
    current_employer {Faker::Name.name}
    graduation_date {Faker::Date.between(600.days.ago, Date.today)}
    cohort_id 1
    password 'password'
 
 #   first_name "MyString"
 #   last_name "MyString"
 #   email "MyString"
 #   current_title "MyString"
 #   current_employer "MyString"
 #   graduation_date "2016-05-15"
 #   cohort_id 1
 #   user_type 1
  end

  factory :admin, parent: :user do |admin_fact|
    admin_fact.admin true
  end

  factory :invalid_user, parent: :user do |invld_fact|
    invld_fact.email nil
  end
end
