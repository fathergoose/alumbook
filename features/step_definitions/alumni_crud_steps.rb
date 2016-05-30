Given(/^I am logged in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I visit the homepage$/) do
  visit "/"
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a way to view all alumni$/) do
  expect(page).to have_content("Alumni")
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am not logged in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I am redirected to sign_in$/) do
  visit "/users/sign_in"
  # pending # Write code here that turns the phrase above into concrete actions
end

