class UserEventsController < ApplicationController
    before_action :logged_in?
    def create
        if UserEvent.find_by(user_id: params[:user_id], event_id: params[:event_id]).nil?
        @userevent = UserEvent.new(user_id: params[:user_id], event_id: params[:event_id])

        flash[:success] = 'Registration Successful !' if @userevent.save
        else
        flash.now[:danger] = "Didn't you already register ?"
        end
        redirect_to event_path(params[:event_id])
    end
end
