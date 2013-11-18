class Ability
  include CanCan::Ability

  def initialize(group)    
    if group
      can :manage, Group,    id:       group.id
      can :manage, Member,   group_id: group.id
      can :manage, EventSet, group_id: group.id
      can :manage, Event,    group_id: group.id
    end
  end
end