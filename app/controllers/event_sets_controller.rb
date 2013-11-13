class EventSetsController < ApplicationController
  before_action :set_event_set, only: [:show, :edit, :update, :destroy]

  # GET /event_sets
  # GET /event_sets.json
  def index
    @event_sets = EventSet.all
  end

  # GET /event_sets/1
  # GET /event_sets/1.json
  def show
  end

  # GET /event_sets/new
  def new
    @event_set = EventSet.new
  end

  # GET /event_sets/1/edit
  def edit
  end

  # POST /event_sets
  # POST /event_sets.json
  def create
    @event_set = EventSet.new(event_set_params)

    respond_to do |format|
      if @event_set.save
        format.html { redirect_to @event_set, notice: 'Event set was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_set }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_sets/1
  # PATCH/PUT /event_sets/1.json
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

  # DELETE /event_sets/1
  # DELETE /event_sets/1.json
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
      params[:event_set]
    end
end
