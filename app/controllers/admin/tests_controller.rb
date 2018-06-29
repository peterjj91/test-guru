class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = current_user.tests.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    # @test.authors.push(current_user)
    @test.author = current_user

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end 

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to :admin_tests, notice: 'Test deleted!'
    else
      render plain: 'Not deleted'
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end