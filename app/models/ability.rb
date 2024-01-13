class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :manage, Category, user_id: user.id
      can :manage, Group, user_id: user.id
      can :manage, Entity, author_id: user.id
      can [:create, :update, :destroy, :index], Transaction do |transaction|
        transaction.category.user_id == user.id
      end
      can :read, Transaction

      # Temporary for testing (using Entity.find):
      entity = Entity.find_by(name: user.name)
      can(:manage, Entity, id: entity.id) if entity && !user.admin?
    end
  end
end
