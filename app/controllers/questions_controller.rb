class QuestionsController < ApplicationController
before_action :require_user, only: [:new]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = @question.title + 'has been updated.'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if (@question.user_id == current_user.id)
      @question.destroy
      redirect_to questions_path
    else
      redirect_to root_path
    end
  end

  private
  def question_params
    params.require(:question).permit(:content, :title)
  end

end
