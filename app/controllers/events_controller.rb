class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
        @event = @user.events.new(event_params)

        if @event.save
            flash[:success ] = "Event successfully created"
            redirect_to event_path(@event)
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
