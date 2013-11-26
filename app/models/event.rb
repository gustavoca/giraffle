class Event < ActiveRecord::Base
  belongs_to :event_set
  has_and_belongs_to_many :organizers, foreign_key: 'event_id', class_name: 'Member'

  before_destroy { organizers.clear }
end
