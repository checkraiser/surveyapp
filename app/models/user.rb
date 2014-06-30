class User < ActiveRecord::Base
	has_secure_password
	validates :full_name, :email, :presence => true
	has_many :surveys
	mount_uploader :avatar, AvatarUploader
end
