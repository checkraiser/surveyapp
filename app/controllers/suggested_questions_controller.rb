class SuggestedQuestionsController < ApplicationController
	before_action :authorize_admin!
	def index
		@suggested_questions = SuggestedQuestion.all
		@suggested_question = SuggestedQuestion.new
	end
	def create
		@suggested_question = SuggestedQuestion.new(suggested_question_params)
		if @suggested_question.save
			flash[:notice] = "Successfully add question"			
		else
			flash[:alert] = "Save error!, please try again."			
		end
		redirect_to suggested_questions_path
	end
	def destroy
		@suggested_question = SuggestedQuestion.find(params[:id])
		@suggested_question.destroy
		redirect_to :action => :index
	end
	private
	def suggested_question_params
		params.require(:suggested_question).permit(:content)
	end
	def authorize_admin!
		authorize! :manage, :all
	end
end