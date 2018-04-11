class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(login: params[:session][:login])
      if user && user.check_password(params[:session][:password])
          log_in user
          #render html: "the user id for the session is : " + user.id.to_s
          #redirect_to homepage_show_home_url
          redirect_to home_url  

          #render html: "correct login"            
      else
          flash.now[:danger] = "Invalid password or login. Try agian."
          render 'new'
          #render html: "incorrect login"
      end
  end

  def destroy
     puts "destrying active session"
     log_out  #defined in SessionsHelper
     redirect_to login_url
  end
  
end
