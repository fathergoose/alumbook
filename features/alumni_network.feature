Feature: A social network for ACLTC alumni and staff
  In order for Alumni to keep in touch
  The alumni
  Must be able to be created, viewed, updated, and destoryed

  Scenario: An alumnus visits the website while logged in
    Given I am logged in
    When I visit the homepage
    Then I should see a way to view all alumni

  Scenario: A alumnus visits the website without being logged in
    Given I am not logged in
    When I visit the homepage
    Then I am redirected to "sign_in"
