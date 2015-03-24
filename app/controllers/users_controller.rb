class UsersController < ApplicationController
  # before_action :require_user, only: [:show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.all
  end

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome to the the site!'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Error creating profile'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
