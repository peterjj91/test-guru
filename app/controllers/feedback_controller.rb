class FeedbackController < ApplicationController

  before_action :authenticate_user!
  
  def sendmessage
    begin
      FeedbackMailer.message_email(current_user, params[:message]).deliver_now
      flash[:notice] = "Сообщение успешно отправлено"
    rescue StandardError => e
      flash[:alert] = e.to_s
    end
    redirect_to root_path
  end
  
  def new
  end
  
  private
  
  def feedback_params
    params.require(:feedback).permit(:message)
  end

end
