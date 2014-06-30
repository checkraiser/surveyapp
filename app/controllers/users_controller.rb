class UsersController < ApplicationController
  before_action :require_signin!, :only => :show
  def new
	@user = User.new
  end
  def edit
	authorize! :update, current_user
	
  end
  def update
	authorize! :update, current_user
	if current_user.update(profile_params)
		flash[:notice] = "Profile update successfully."
		redirect_to profile_path
	else
		flash[:error] = "There are errors."
		redirect_to edit_profile_path
	end
  end
  def create		
	@user = User.new(user_params)	
	if @user.save
		flash[:notice] = "You have signed up successfully."
		session[:user_id] = @user.id
		redirect_to profile_path
	else
	render :new
	end
  end

  def show	
  	@surveys = current_user.surveys
  end
  
  private
  def profile_params
	params.permit(:full_name, :email, :bio, :avatar)
  end
  def user_params      
	params[:user][:password_confirmation] = params[:user][:password]
	params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
