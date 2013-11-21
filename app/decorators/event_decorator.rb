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

  def members_names(opts={})
    excluded_members = opts.fetch(:excluding) { Array.new }
    separator        = opts.fetch(:separator) { ', ' }

    if excluded_members.any?
      members.where{id.not_in excluded_members}.pluck(:name).join(separator)
    else
      members.pluck(:name).join(separator)
    end
  end

end
