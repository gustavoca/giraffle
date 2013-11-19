class Ability
  include CanCan::Ability

  def initialize(group)
  	group ||= Group.new

    if group.persisted?
      can [:read, :update, :destroy], Group, id: group.id
      can :manage, Member,   group_id: group.id
      can :manage, EventSet, group_id: group.id
      can :manage, Event,    group_id: group.id
    else	
    	can :create, Group
    end
  end
end