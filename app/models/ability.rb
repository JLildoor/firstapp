class Ability
  include CanCan::Ability

  # Define abilities for the passed in user here. For example:

  def initialize(user)
    if
      user ||= User.new # guest user (not logged in)
      can :manage, User, id: user.id #permissions for every user, even if not logged in
    else
      user.admin? # administrators
      can :manage, :all
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
