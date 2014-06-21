class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def home
    if current_user
      redirect_to profile_path
    else
      redirect_to signin_path
    end
  end
  def success
    render 'surveys/success', :layout => 'success'
  end
  def require_signin!
	if current_user.nil?
		flash[:error] =
		"You need to sign in or sign up before continuing."
		redirect_to signin_url
	end
  end
  def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
