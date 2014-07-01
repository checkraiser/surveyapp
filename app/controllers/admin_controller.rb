class AdminController < ApplicationController
	def dashboard
		authorize! :manage, :all
		@users_count = User.count
		@surveys_count = Survey.count
		
		temp = 0
		Survey.all.each do |s|
			temp += s.responses.count
		end
		@responses_count = temp
	end
	def users
		authorize! :manage, :all
		@users = User.all
	end
end