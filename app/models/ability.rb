class Ability
	include CanCan::Ability
	def initialize(user)
		user ||= User.new
		can :create, Survey if user.id					
		can :update, User, :id => user.id
		can :continue, Survey, :user_id => user.id, :state => 'draft'
		if user.admin == true
			can :manage, :all
		end
	end
end