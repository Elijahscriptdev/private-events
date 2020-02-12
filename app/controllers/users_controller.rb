class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @user_events = @user.events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:info] = "Welcome to the Private Events #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
