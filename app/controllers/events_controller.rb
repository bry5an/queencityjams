class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  
  def index
    @events = Event.order(:id).page params[:page]
    @artist_search = Event.search(params[:search])
    @all_events = Event.all
  end

  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

end
