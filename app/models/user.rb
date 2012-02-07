class User < ActiveRecord::Base

	attr_accessible :email, :first_name, :last_name, :avatar_image, :retained_avatar_image, :remove_avatar_image

	validates :email, :presence => true, :uniqueness => true
	validates_presence_of :first_name
	validates_presence_of :last_name

	image_accessor :avatar_image

	def name
		[first_name, last_name].join ' '
	end

end
