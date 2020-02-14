# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_events = @user.events
    @past_events = @user.attended_events.past
    @upcoming_events = @user.attended_events.upcoming
    # @upcoming_events = @events.upcoming
    # @past_events = @events.past
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Private Events #{@user.username}"
      redirect_to user_path(@user)
      # flash.now[:info] = "Welcome to the Private Events #{@user.username}"
      # redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
