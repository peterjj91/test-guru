class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
        render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  def achievements
    @achieved_badges = current_user.badges.group(:name, :badge_image).count
  end

  private
  
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :rule_name, :rule_parameter, :badge_image)
  end

end
