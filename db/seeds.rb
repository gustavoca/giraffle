group = Group.create(group_id:'vamonospest', name:'Vamonos Pest!', password:'password', password_confirmation:'password')

Member.create(name:'Walter White', email: 'wwhite@vamonospest.com', group:group)
Member.create(name:'Jesse Pinkman', email: 'jpinkman@vamonospest.com', group:group)
Member.create(name:'Mike Ehrmantraut', email: 'mehrmantraut@vamonospest.com', group:group)
Member.create(name:'Todd Alquist', email: 'talquist@vamonospest.com', group:group)
Member.create(name:'Uncle Jack', email: 'ujack@vamonospest.com', group:group)
Member.create(name:'Gustavo Fring', email: 'gfring@lospolloshermanos.com', group:group)
Member.create(name:'Saul Goodman', email: 'sgoodman@bettercallsaul.com', group:group)
Member.create(name:'Tuco Salamanca', email: 'tsalamanca@carteljuarez.com', group:group)
Member.create(name:'Leonel Salamanca', email: 'lsalamanca@carteljuarez.com', group:group)
Member.create(name:'Marco Salamanca', email: 'msalamanca@carteljuarez.com', group:group)
Member.create(name:'Hector Salamanca', email: 'hsalamanca@carteljuarez.com', group:group)
Member.create(name:'Don Eladio', email: 'evuente@carteljuarez.com', group:group)

EventSet.create(name:'Meth Cooking Lessons', start_date:Time.now, interval:7, organizers_per_event:3, num_of_members_to_raffle:Member.where(group: group).count, group:group)

event_set = EventSet.find(1)
event_set.raffle(Member.where(group: group))
event_set.save!