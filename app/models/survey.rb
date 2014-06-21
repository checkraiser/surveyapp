class Survey < ActiveRecord::Base
	has_many :questions
	has_many :surveyees
	belongs_to :user
	accepts_nested_attributes_for :questions
	accepts_nested_attributes_for :surveyes
end
