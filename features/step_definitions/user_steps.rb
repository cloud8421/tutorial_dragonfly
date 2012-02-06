Given /^a user exists with email "([^"]*)"$/ do |email|
	Factory(:user, :email => email)
end

Given /^I am on the home page$/ do
	visit '/'
end

When /^I click "([^"]*)"$/ do |name|
	click_button name
end

Then /^I should be on (.+)$/ do |page|
	current_path = URI.parse(current_url).path
	current_path.should == path_to(page_name)
end

Given /^I am on the profile page for "([^"]*)"$/ do |email|
	visit user_path(User.find_by_email(email))
end

When /^I change my email with "([^"]*)"$/ do |email|
	fill_in :email, :with => email
end

Then /^I should see "([^"]*)"$/ do |content|
	page.should_contain content
end