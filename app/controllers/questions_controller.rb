class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:show, :destroy]

  def index
    @tests = Test.find(params[:test_id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    if @question.delete
      render 'index'
    else
      render plain: 'The question not deleted'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
