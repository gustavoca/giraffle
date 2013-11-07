group = Group.create(group_id:'vamonospest', name:'Vamonos Pest!', password:'password', password_confirmation:'password')

Member.create(name:'Walter White', group:group)
Member.create(name:'Jesse Pinkman', group:group)
Member.create(name:'Mike Ehrmantraut', group:group)
Member.create(name:'Todd Alquist', group:group)
Member.create(name:'Uncle Jack', group:group)
Member.create(name:'Gustavo Fring', group:group)
Member.create(name:'Saul Goodman', group:group)
Member.create(name:'Tuco Salamanca', group:group)
Member.create(name:'Leonel Salamanca', group:group)
Member.create(name:'Marco Salamanca', group:group)

EventSet.create(name:'Meth Cooking Lessons', start_date:Time.now, interval:7, organizers_per_event:3, num_of_members_to_raffle:Member.where(group: group).count, group:group)