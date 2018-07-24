class AchievementsController < ApplicationController

  before_action :authenticate_user!

  def index
    @achieved_badges = current_user.badges.group(:name, :badge_image).count
  end

end
