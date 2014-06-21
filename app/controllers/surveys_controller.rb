class SurveysController < ApplicationController
  before_action :require_signin!, :except => [:show, :update]
  before_action :set_surveyee, :except => [:new, :create]
  def new
	@survey = current_user.surveys.build
	@name = "Survey #{current_user.surveys.count.to_s}"
	5.times { @survey.questions.build }
	5.times { @survey.surveyees.build }
  end

  def create
  	@survey = current_user.surveys.new(survey_params)
  	if @survey.save
  		redirect_to profile_path
  	else
  		redirect_to new_survey_path
  	end
  end

  def show
    
  end

  def update
    sum = 0
    surveyee_params.each do |k, v|
      sum += v.to_i
    end
    @surveyee.update(score: sum)
    redirect_to success_path
  end

  private
  def set_surveyee
    @surveyee = Surveyee.find_by_random_string(params[:random_string])
    @survey = @surveyee.survey
  end
  def surveyee_params
    params.require(:questions)
  end
  def survey_params
  	params.require(:survey).permit(:name, questions_attributes: [:content], surveyees_attributes: [:email])
  end
end
