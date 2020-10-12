class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create destroy]

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    @answer.save ? (redirect_to @answer) : (render :new)
  end

  def update
    @answer.update(answer_params) ? (redirect_to @answer) : (render :edit)
  end

  def destroy
    @question.answers.find(params[:id]).destroy
    redirect_to @question
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
