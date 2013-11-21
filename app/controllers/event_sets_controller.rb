class EventSetsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_event_set, only: [:show, :edit, :update, :destroy]

  def index
    @event_sets = current_group.event_sets.decorate
  end

  def show
  end

  def new
    @event_set = EventSet.new
  end

  def edit
  end

  def create
    @event_set = EventSet.new(event_set_params)
    @event_set.group = current_group

    respond_to do |format|
      if @event_set.save
        NotificationService.send_new_event_set_created_notification(@event_set);
        format.html { redirect_to @event_set, notice: 'Event set was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_set }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_set.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event_set.update(event_set_params)
        format.html { redirect_to @event_set, notice: 'Event set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_set.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_set.destroy
    respond_to do |format|
      format.html { redirect_to event_sets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_set
      @event_set = EventSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_set_params
      params.require(:event_set).permit(:name, :start_date, :interval, :organizers_per_event, :member_ids => [])
    end
end
