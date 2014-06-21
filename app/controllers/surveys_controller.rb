class SurveysController < ApplicationController
  before_action :require_signin!
  def new
	@survey = current_user.surveys.build
	5.times { @survey.questions.build }
	5.times { @survey.surveyees.build }
  end

  def create
  end
end
