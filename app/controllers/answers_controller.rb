class AnswersController < ApplicationController
  before_action :require_user, only: [:new]
  has_many :votes, :as => :voteable

  def upvote
    @answer = Answer.find(params[:id])
    @answer.votes.create
    redirect_to(answers_path)


  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer add to ' + @question.title
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = 'Answer has been changed.'
      redirect_to question_path(@answer.question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@answer.post)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end

end
