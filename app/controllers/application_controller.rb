class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_entry_not_found

  helper_method :current_user, :logged_in?

  private

  def rescue_with_entry_not_found
    render html: '<h1>Entry not found</h1>'.html_safe
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "Are you a Guru? Verify your Email and Password please"
    end

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
