class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def require_user
        return if logged_in?

        flash[:danger] = 'You must log in to perform that action'
        redirect_to root_path
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !current_user.nil?
    end

    def sign_in
        session[:user_id] = user.id
        cookies.permanent.signed[:user_id] = user.id
        user.create_token_and_save
        cookies.permanent[:remember_digest] = user.remember_digest
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
