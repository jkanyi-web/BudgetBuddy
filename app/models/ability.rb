class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      can :manage, User if user.admin?
    else
      can :manage, Category, user_id: user.id
      can :manage, Group, user_id: user.id
      can :manage, Entity, author_id: user.id
      can [:create, :update, :destroy, :index], Transaction do |transaction|
        transaction.category.user_id == user.id
      end
      can :read, Transaction
    end
  end
end
