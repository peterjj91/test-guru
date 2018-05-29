class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to @test, notice: 'Test created'
    else
      render :new
    end
  end 

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test edited!'
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to tests_path, notice: 'Test deleted!'
    else
      render plain: 'Not deleted'
    end
  end

  def search
    result = ["Class #{params.class}", "Parameters #{params.inspect}"]

    render plain: result.join("\n")
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end