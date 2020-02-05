class UsersController < ApplicationController
    def new
  	@user = User.new
  end

  def show
  	@user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:info] = "Welcome to the Private Events #{@user.username}"
      redirect_to 
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password,
                                 :password_confirmation)
  end
end
