class SurveysController < ApplicationController
  before_action :require_signin!, :except => [:show, :update]
  before_action :set_surveyee, :only => [:show, :update]
  def new
    authorize! :create, Survey
    @suggested_questions = SuggestedQuestion.all
  	@survey = current_user.surveys.build
  	@name = "Survey #{current_user.surveys.count.to_s}"
  	5.times { @survey.questions.build }
  	5.times { @survey.surveyees.build }
  end

  
  def continue
	@survey = Survey.find(params[:id])
	@name = "Survey #{current_user.surveys.count.to_s}"
	authorize! :continue, @survey
	@suggested_questions = SuggestedQuestion.all
	(5 - @survey.surveyees.count).times { @survey.surveyees.build }
	(5 - @survey.questions.count).times { @survey.questions.build }
  end
  def update_survey
	@survey = Survey.find(params[:id])
	authorize! :continue, @survey
	@survey.questions.destroy_all
	@survey.surveyees.destroy_all
	
  	if @survey.update(survey_params)
		if params[:commit] == 'Save draft'
			@survey.draft!				
		else
			@survey.deliver
		end
		flash[:notice] = "Update successfully."
  		redirect_to profile_path
  	else
		flash[:error] = "Can't update survey"
  		redirect_to continue_survey_path(@survey)
  	end
  end
  def create
    authorize! :create, Survey
  	@survey = current_user.surveys.new(survey_params)
  	if @survey.save
		if params[:commit] == 'Save draft'
			@survey.draft!				
		else
			@survey.deliver
		end
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
    @surveyee.update(comment: params[:comment], score: sum)
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
