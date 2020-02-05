class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = user.id
  #     flash.now[:info] = 'Account was successfully created'
  #     redirect_to new_user_path
  #   else
  #     render 'new'
  #   end
  # end

  def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There is something wrong with your login information"
            render 'new'
        end
    end

   private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
