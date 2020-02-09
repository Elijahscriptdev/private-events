class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
        @event = current_user.events.build(event_params)
        @event.creator = current_user
        if @event.save
            flash[:success ] = "Event successfully created"
            redirect_to events_path
        else
            flash[:danger] = "something went wrong"
            render 'new'
        end
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:event_name, :event_date)
    end
end
