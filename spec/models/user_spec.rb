require 'spec_helper'

describe User do

	context "validations" do
		
    let!(:user) {Factory(:user)}

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

	end  

end