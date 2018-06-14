class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_entry_not_found

  def rescue_with_entry_not_found
    render html: '<h1>Entry not found</h1>'.html_safe
  end

end
