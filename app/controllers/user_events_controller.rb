# frozen_string_literal: true

class UserEventsController < ApplicationController
  before_action :logged_in?
  before_action :require_login, only: %i[new show]

  def create
    if UserEvent.find_by(user_id: params[:user_id], event_id: params[:event_id]).nil?
      @userevent = UserEvent.new(user_id: params[:user_id], event_id: params[:event_id])
      if @userevent.save
        flash.now[:success] = 'Registration Successful !!!'
      end
    else

      flash.now[:danger] = "Not Successful!!!"
    end
    redirect_to root_path
  end

  private

  def require_login
    logged_in?
    flash[:danger] = 'You must be logged in to access this section'
    redirect_to root_path
  end
end
