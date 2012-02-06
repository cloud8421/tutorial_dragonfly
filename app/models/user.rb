class User < ActiveRecord::Base

	attr_accessible :email, :first_name, :last_name

	validates :email, :presence => true, :uniqueness => true
	validates_presence_of :first_name
	validates_presence_of :last_name

end
