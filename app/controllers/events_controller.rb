# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_login, only: %i[create show]

  def index
    @events = Event.all
    @upcoming_events = @events.upcoming
    @past_events = @events.past
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
      flash[:success] = 'Event successfully created'
      redirect_to events_path
    else
      flash[:danger] = 'something went wrong'
      render 'new'
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    flash[:success] = 'Event has been deleted'
    redirect_to root_path
  end

  private

  def require_login
    logged_in?
    flash[:danger] = 'You must be logged in to access this section'
    redirect_to root_path
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_date, :description, :location)
  end
end
