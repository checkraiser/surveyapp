class Survey < ActiveRecord::Base
	has_many :questions
	has_many :surveyees
	belongs_to :user
	accepts_nested_attributes_for :questions
	accepts_nested_attributes_for :surveyees, :reject_if => :all_blank
	after_create :notify_surveyees
	def score
		surveyees.sum(:score)
	end
	def responses
		surveyees.where('score > 0')
	end
	private
	def notify_surveyees
		surveyees.each do |s|
			SurveyMailer.notify(user, s , self).deliver		
		end
	end
end
