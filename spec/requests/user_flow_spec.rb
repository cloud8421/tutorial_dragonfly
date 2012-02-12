require 'spec_helper'

describe "User flow"  do
	
	let!(:user) { Factory(:user, email: "email@example.com") }

	describe "viewing the profile" do

		it "should show the profile for the user" do
			visit '/'
			page.find('tr', text: user.email).click_link("Profile")
			current_path = URI.parse(current_url).path
			current_path.should == user_path(user)
		end

	end

	describe "updating profile data" do

		it "should save the changes" do
			visit '/'
			page.find('tr', text: user.email).click_link("Profile")
			click_link 'Edit'
			fill_in :email, with: "new_email@example.com"
			click_button 'Save'
			current_path.should == user_path(user)
			page.should have_content "User updated" 
		end

	end

	describe "managing the avatar" do

		it "should save the uploaded avatar" do
  		user.avatar_image = Rails.root + 'spec/fixtures/mustache_avatar.jpg'
  		user.save
  		visit user_path(user)
  		click_link 'Edit'
  		attach_file 'user[avatar_image]', Rails.root + 'spec/fixtures/mustache_avatar.jpg'
  		click_button 'Save'
  		current_path.should == user_path(user)
  		page.should have_content "User updated"
  		n = Nokogiri::HTML(page.body)
  		n.xpath(".//img").first['src'].should =~ /mustache_avatar/
  	end

  	it "should remove the avatar if requested" do
  		user.avatar_image = Rails.root + 'spec/fixtures/mustache_avatar.jpg'
  		user.save
  		visit user_path(user)
  		click_link 'Edit'
  		check "Remove avatar image"
  		click_button 'Save'
  		current_path.should == user_path(user)
  		page.should have_content "User updated"
  		n = Nokogiri::HTML(page.body)
  		n.xpath(".//img").first['src'].should =~ /placehold.it/
  	end

	end

end