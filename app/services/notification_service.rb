class NotificationService
	def self.send_new_event_set_created_notification(event_set)
		event_set.members.each do |member|
			Notifier.event_set_created(member, member.events_from_set(event_set).first).deliver
		end
	end
end