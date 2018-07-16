class FeedbackController < ApplicationController

  before_action :authenticate_user!
  
  def sendmessage
    FeedbackMailer.message_email(current_user, params[:message]).deliver_now
    flash[:notice] = "Сообщение успешно отправлено"
    redirect_to root_path

  rescue StandardError => e
    flash[:alert] = e.to_s
  end
  
  def new
  end
  
  private
  
  def feedback_params
    params.require(:feedback).permit(:message)
  end

end
