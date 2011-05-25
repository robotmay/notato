class Ability
  include CanCan::Ability

  def initialize(user)
		user ||= User.new
		can :read, Notepatch do |notepatch|
			notepatch.public?
		end
		can :read, Note do |note|
			note.notepatch.public?
		end
		can :manage, Notepatch do |notepatch|
			notepatch.user === user
		end
		can :manage, Note do |note|
			note.notepatch.user === user
		end
  end
end
