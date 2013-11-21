class MemberDecorator < Draper::Decorator
  delegate_all

  def linked_name
  	h.link_to object.name, object
  end

  def first_name
		name.split(' ')[0]
	end

end
