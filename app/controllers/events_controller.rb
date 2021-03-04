class EventsController < ApplicationController
  def index
    
  end  
  
  def new
      @event = current_user.events.build
   end

   def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else 
      render :new
    end
   end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :time)
  end

end
