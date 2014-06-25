class Ability
	include CanCan::Ability
	def initialize(user)
		user ||= User.new
		can :create, Survey, :user_id => user.id
		if user.admin == true
			can :manage, :all
		end
	end
end