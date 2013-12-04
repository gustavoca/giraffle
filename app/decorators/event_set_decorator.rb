class EventSetDecorator < Draper::Decorator
  delegate_all
  decorates_association :events

  def linked_name
  	h.link_to object.name, object
  end

  def start_date
  	object.start_date.strftime('%A %d of %B %Y')
  end

end
