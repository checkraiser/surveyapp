class Ability
	include CanCan::Ability
	def initialize(user)
		user ||= User.new
		can :create, Survey, :user_id => user.id
	end
end