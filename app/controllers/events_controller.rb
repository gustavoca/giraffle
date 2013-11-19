class EventsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_event, only: [:show]

  def index
    @events = current_group.events.where{date >= Time.now}
  end

  def show
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
