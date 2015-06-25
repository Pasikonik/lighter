class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can [:read, :create], Video
      can [:update, :destroy], Video, user_id: user.id
      can :read, [Image, Tutorial, Entry]
    end

  end
end
