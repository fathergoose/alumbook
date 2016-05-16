# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cohort = Cohort.new(name: 'the_el_ninos',
                      campus: 'Chicago',
                      instructor: 'PXJ',
                      cohort_date: '1-1-2015')
p cohort
cohort.save

users = [
  {first_name: 'peter',
  last_name: 'jang',
  phone: '555-555-5555',
  email: 'peter@acltc.com',
  password: 'password',
  admin: true},

  {first_name: 'al',
  last_name: 'ilseman',
  phone: '555-555-0000',
  email: 'al@ilseman.com',
  password: 'password',
  admin: false,
  cohort_id: 1,
  graduation_date: Time.now}]

# Feel free to add yourselves as users

users.each do |u|
  new_user = User.new u
  new_user.save
end




