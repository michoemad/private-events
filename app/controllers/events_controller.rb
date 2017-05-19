class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new 
		@event = Event.new

	end

	def create
		@event = Event.new(params.require(:event).permit(:name,:time,:creator_id))
		flash[:notice] = @event.valid?.to_s
		if @event.save
			flash[:notice] = "Event created"
			redirect_to events_url
		else
			flash[:notice] = "There was an error"
			redirect_to new_event_url
		end


	end

	def show
		@event = Event.find(params[:id])

	end

end
