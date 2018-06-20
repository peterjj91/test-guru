class SessionsController < Devise::SessionsController

  #def new; end

#  def create
#    user = User.find_by(email: params[:email])
#
#    if user&.authenticate(params[:password])
#      session[:user_id] = user.id
#      redirect_to cookies[:current_url]
#      flash[:notice] = "Hello, #{current_user.full_name}!"
#    else
#      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
#      render :new
#    end
#  end

  def create
    super
    flash[:notice] = 'Hello, #{current_user.full_name}'
  end

  #def destroy
  #  session[:user_id] = nil
  #  redirect_to login_path, notice: 'You are signed out of the system'
  #end

end
