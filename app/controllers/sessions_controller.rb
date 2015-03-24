class SessionsController < ApplicationController

  def create
    user = User.find_by(name:params[:name])
      if User.authenticate(params[:name])
        flash[:notice] = "You've been logged in"
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:error] = 'User name entered incorrectly.'
        render 'new'
      end
    end

    def destroy
      session[:user_id] = nil
      flash[:notice] = "You've been logged out successfully."
      redirect_to root_path
    end

  end
