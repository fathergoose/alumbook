FactoryGirl.define do
  factory :graduate do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.cell_phone}
    current_title {Faker::Name.title}
    current_employer {Faker::Name.name}
    graduation_date {Faker::Date.between(600.days.ago, Date.today)}
  end
end