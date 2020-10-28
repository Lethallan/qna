class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: %i[new create]
  before_action :load_answer, only: %i[edit update update_inline destroy]

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    @answer.save ? (redirect_to @answer.question) : (render 'questions/show')
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer.question
    else
      render 'answers/edit'
    end
  end

  def update_inline
    if @answer.update(answer_params)
      redirect_to @answer.question
    else
      render @answer.question
    end
  end

  def destroy
    if @answer.user == current_user
      @answer.destroy
      redirect_to question_path(@answer.question)
    end
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  # def set_answer
  #   @answer = @question.answers.find(params[:id])
  # end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
