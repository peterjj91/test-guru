class TestsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  before_action :create_user, only: [:create]

  def index
    render html: index_page.html_safe
  end

  def show
    render html: show_page.html_safe
  end

  def new

  end

  def create
    # в задании не было
    # для выполнения нужен пользователь

    test = @test.new(test_params)

    render plain: test.inspect
    # if test.save
    #   render plain: 'The question was saved'
    # else
    #   render 'new'
    # end
  end

  def destroy
    # в задании не было

    # @test.delete
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

  def create_user
    @user = User.last
  end

  def index_page
    html_string = "<h1>All tests:</h1><ul>"
    @test.each { |test| html_string << "<li>ID - #{test.id} and TITLE - #{test.title}. </li>" }
    html_string << "</ul><a href='/tests/new'>add questions</a>"
    html_string
  end

  def show_page
    params_id = params[:id]

    html_string = "<h1>Question №#{params_id}</h1>"

    @questions.each do |questions|
      if questions.id == params_id.to_i
        html_string << "<p>'#{questions.body}' with id ##{questions.id}</p>"
      end
    end

    html_string
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end