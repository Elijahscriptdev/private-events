class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      flash.now[:info] = 'Account was successfully created'
      redirect_to 
    else
      render 'new'
    end
  end

   private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
