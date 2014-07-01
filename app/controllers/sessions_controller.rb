class SessionsController < ApplicationController
  def new
	redirect_to profile_path if current_user
  	@user = User.new
  	render :new, :layout => 'success'
  end

  def create
	redirect_to profile_path if current_user
	user = User.where(:email => params[:signin][:email]).first
	if user && user.authenticate(params[:signin][:password])
		session[:user_id] = user.id
		flash[:notice] = "Signed in successfully."
		redirect_to profile_url
	else
		flash[:error] = "Invalid username or password"
		render :new
	end
  end

  def destroy	
	session[:user_id] = nil
	redirect_to '/'
  end
end
