Given /^a user exists with email "([^"]*)"$/ do |email|
Factory(:user, email: email)
end

Given /^the user with email "([^"]*)" has the mustache avatar$/ do |email|
u = User.find_by_email(email)
u.avatar_image = Rails.root + 'spec/fixtures/mustache_avatar.jpg'
u.save
end

Then /^I should see "([^"]*)"$/ do |content|
page.should have_content(content)
end

Then /^the profile should show "([^"]*)"$/ do |image|
n = Nokogiri::HTML(page.body)
n.xpath(".//img").first['src'].should =~ pattern_for(image)
end


Given /^I change the email with "([^"]*)" for "([^"]*)"$/ do |new_email, old_email|
	u = User.find_by_email(old_email)
	visit edit_user_path(u)
	fill_in :email, with: new_email
	click_button 'Save'
end

Given /^I upload the mustache avatar for "([^"]*)"$/ do |email|
	u = User.find_by_email(email)
	visit edit_user_path(u)
	attach_file 'user[avatar_image]', Rails.root + 'spec/fixtures/mustache_avatar.jpg'
	click_button 'Save'
end

Given /^the user "([^"]*)" has the mustache avatar and I remove it$/ do |email|
	u = User.find_by_email(email)
	u.avatar_image = Rails.root + 'spec/fixtures/mustache_avatar.jpg'
	u.save
	visit edit_user_path(u)
	check "Remove avatar image"
	click_button 'Save'
end

Then /^the user "([^"]*)" should have "([^"]*)"$/ do |email, image|
	u = User.find_by_email(email)
	visit user_path(u)
	n = Nokogiri::HTML(page.body)
	n.xpath(".//img").first['src'].should =~ pattern_for(image)
end

def pattern_for(image_name)
	case image_name
	when 'the placeholder avatar'
		/placehold.it/
	when 'the mustache avatar'
		/mustache_avatar/
	end
end