Feature: managing user profile
	As a user
	In order to manage my data
	I want to access my user profile page

	Background:
		Given a user exists with email "email@example.com"

	Scenario: editing my profile
		Given I change the email with "new_mail@example.com" for "email@example.com"
		Then I should see "User updated"

	Scenario: adding an avatar
		Given I upload the mustache avatar for "email@example.com"
		Then the profile should show "the mustache avatar"

	Scenario: removing an avatar
		Given the user "email@example.com" has the mustache avatar and I remove it
		Then the user "email@example.com" should have "the placeholder avatar"
