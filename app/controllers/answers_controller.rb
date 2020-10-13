class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: %i[show new edit create update destroy]
  before_action :set_answer, only: %i[show edit update destroy]

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    @answer.save ? (redirect_to @answer.question) : (render 'questions/show')
  end

  def update
    @answer.update(answer_params) ? (redirect_to @answer.question) : (render 'questions/show')
  end

  def destroy
    if @answer.user == current_user
      @answer.destroy
      redirect_to @question
    end
  end

  private

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
