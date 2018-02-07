class Ability
  include CanCan::Ability

  def initialize(user)
    if user
        if user.tipo == "programmer"
            can :access, :rails_admin
            can :dashboard, :all
            can :manage, Projeto
            can :manage, Bug

        elsif user.tipo == "manager"
            can :manage, :all 
        end
    end
  end
end
