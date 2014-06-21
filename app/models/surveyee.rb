class Surveyee < ActiveRecord::Base
	validates :email, :presence => true
	belongs_to :survey
	before_save :set_random_string

	private
	def set_random_string
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		tmp = (0...50).map { o[rand(o.length)] }.join
		self.random_string = tmp
	end
end
