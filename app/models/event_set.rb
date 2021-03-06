class EventSet < ActiveRecord::Base
  belongs_to :group
  has_many 	 :events, dependent: :delete_all
  has_and_belongs_to_many :members

  validates :name, presence: true
  validates :start_date, presence: true
  validates :interval, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 365 }
  validates :organizers_per_event, presence: true, numericality: { only_integer: true }

  before_create :raffle
  before_destroy { members.clear }

  def raffle
    logger.info 'raffling...'
    events.clear
    counter = 0
    members_array = members.to_a

    (members_array.count / organizers_per_event).times do
      members_array.shuffle!
      event = Event.new
      event.date = start_date + (interval * counter).days
      event.organizers << members_array.shift(organizers_per_event)
      counter += 1
      event.order = counter 
      events << event
  	end
  	
  	if members_array.count > 0
  		members_array.each do |member|
  			events.select { |event| event.organizers.count == organizers_per_event }.sample.organizers << member
  			members_array.shift
  		end
  	end
  end

end
