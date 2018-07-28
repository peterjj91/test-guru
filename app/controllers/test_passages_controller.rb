class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result
    @test_passage.finish!

    new_badges = CheckAchievements.new(@test_passage).call
    
    if new_badges.count > 0
      current_user.badges << new_badges
      flash[:notice] = "You have #{new_badges.count} new badges" if new_badges.count > 0
    end
  end

  # def update
  #   @test_passage.accept!(params[:answer_ids])

  #   if @test_passage.completed?
  #     TestsMailer.completed_test(@test_passage).deliver_now
  #     redirect_to result_test_passage_path(@test_passage)
  #   else
  #     render :show
  #   end
  # end

  def update
    if @test_passage.remaining_time <= 0
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answers_ids])
      if @test_passage.completed?
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  def gist
    gist = GistQuestionService.new(@test_passage.current_question)
    gist.call

    flash_options = if gist.created?
                      current_user.add_gist(@test_passage.current_question, gist.url)
                      { notice: t('.success', url: gist.url) }
                    else
                      { notice: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end