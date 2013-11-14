class Member < ActiveRecord::Base
	belongs_to :group
	has_and_belongs_to_many :events

	validates :group, presence: true
	validates :name,  presence: true
	#validates :email, email: true

	def events_to_organize
		events.where{date >= Time.now}
	end

	def organized_events
		events.where{date < Time.now}
	end
end
