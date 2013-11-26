class EventDecorator < Draper::Decorator
  delegate_all
  decorates_association :event_set
  
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def order
  	object.order.ordinalize
  end

  def date
  	object.date.strftime('%A %d of %B %Y')
  end

  def organizers_names(opts={})
    excluded_organizers = opts.fetch(:excluding) { Array.new }
    separator = opts.fetch(:separator) { ', ' }

    if excluded_organizers.any?
      object.organizers.where{id.not_in excluded_organizers}.pluck(:name).join(separator)
    else
      object.organizers.pluck(:name).join(separator)
    end
  end

end
