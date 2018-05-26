class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :find_user, only: %i[start new]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = @user.author_tests.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    @test.author = @user

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end 

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Success story!'
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to tests_path
    else
      render plain: 'Not deleted'
    end
  end

  def search
    result = ["Class #{params.class}", "Parameters #{params.inspect}"]

    render plain: result.join("\n")
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

end