class UsersController < ApplicationController
  before_action :require_signin!, :only => :show
  def new
	@user = User.new
  end

  def create		
	@user = User.new(user_params)	
	if @user.save
		flash[:notice] = "You have signed up successfully."
		redirect_to profile_path
	else
	render :new
	end
  end

  def show	
  end
  
  private
  def user_params      
	params[:user][:password_confirmation] = params[:user][:password]
	params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
