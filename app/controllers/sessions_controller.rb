class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(login: params[:session][:login])
      if user && user.check_password(params[:session][:password])
          log_in user
          redirect_to home_url  
      else
          flash.now[:danger] = "Invalid password or login. Try agian."
          render 'new'
      end
  end

  def destroy
     log_out  #defined in SessionsHelper
     redirect_to login_url
  end
  
end
