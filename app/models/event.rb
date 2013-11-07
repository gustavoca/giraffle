class Event < ActiveRecord::Base
  belongs_to :event_set
  has_and_belongs_to_many :members

  before_destroy { members.clear }
end
