class TestsController < ApplicationController
  before_action :find_test, only: [:index, :show, :create]
  before_action :find_question, only: [:show, :destroy]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end 

  def destroy
    if @test.destroy
      redirect_to tests_path
    else
      render plain: 'Not deleted'
    end
  end

  def edit 
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def search
    result = ["Class #{params.class}", "Parameters #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def find_test
    @test = Test.all
  end

  def find_question
    @questions = Question.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end