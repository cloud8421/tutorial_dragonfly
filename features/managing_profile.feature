Feature: managing user profile
	As a user
	In order to manage my data
	I want to access my user profile page

	Background:
		Given a user exists with email "email@example.com"

	Scenario: viewing my profile
		Given I am on the home page
		When I click "Profile"
		Then I should be on my profile page

	Scenario: editing my profile
		Given I am on my profile page
		When I press "Edit"
		And I change my email with "new_email@example.com"
		And I press "Save"
		Then I should be on my profile page
		And I should see "Profile updated"