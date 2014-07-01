class User < ActiveRecord::Base
	has_secure_password
	validates :full_name, :email, :presence => true
	has_many :surveys
	mount_uploader :avatar, AvatarUploader
	
	def avg
		temp = 0
		score = 0
		surveys.each do |s|
			temp += s.responses.count * 5
			score += s.score
		end
		return 0 if temp == 0
		return score/temp.to_f
	end
end
