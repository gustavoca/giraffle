class EventSet < ActiveRecord::Base
  belongs_to :group
  has_many 	 :events, dependent: :delete_all
  has_and_belongs_to_many :members
  
  validates :name, presence: true
  validates :start_date, presence: true
  
  def raffle
  	events.clear
  	event_count = 1
  	
  	(members.count / organizers_per_event).times do
  		members.shuffle!
  		event = Event.new
  		event.date = start_date + (interval * event_count).days
  		event.members << members.shift(organizers_per_event)
  		events << event
  		event_count += 1
  	end
  	
  	if members.count > 0
  		members.each do |member|
  			events.select { |event| event.members.count == organizers_per_event }.sample.members << member
  			members.shift
  		end
  	end
  end

end
