class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = Event.where{group == current_group && date >= Time.now}
  end

  def show
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
