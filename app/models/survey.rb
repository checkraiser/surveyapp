class Survey < ActiveRecord::Base
	has_many :questions
	has_many :surveyees
	belongs_to :user
end
