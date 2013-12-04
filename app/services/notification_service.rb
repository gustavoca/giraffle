class NotificationService

	def self.send_new_event_set_created_notification(event_set)
		event_set.members.each do |member|
			Notifier.event_set_created(member, member.event_from_set(event_set)).deliver
		end
	end
	
end