require 'spec_helper'

describe User do

	let!(:user) {Factory(:user)}

	context "validations" do
		
    let!(:user) {Factory(:user)}

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

	end

	context "attributes" do

		before do
			user.update_attributes(:first_name => "John", :last_name => "Doe")
		end

		%w(email first_name last_name).each do |attr|
			it { should allow_mass_assignment_of(attr.to_sym) }
		end

		it "should have a name attribute" do
			user.should respond_to(:name)
		end


		it "should have the right name" do
			user.name.should eq('John Doe')
		end

	end

	context "avatar attributes" do

		%w(avatar_image retained_avatar_image remove_avatar_image).each do |attr|
			it { should allow_mass_assignment_of(attr.to_sym) }
		end

		it "should have a image accessor attribute" do
			user.should respond_to(:avatar_image)
		end

		it "should validate the file size of the avatar" do
			user.avatar_image = Rails.root + 'spec/fixtures/huge_size_avatar.jpg'
			user.should_not be_valid
		end

		it "should validate the format of the avatar" do
			user.avatar_image = Rails.root + 'spec/fixtures/dummy.txt'
			user.should_not be_valid
		end

	end

end