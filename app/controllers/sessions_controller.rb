class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(login: params[:session][:login])
      if user && user.check_password(params[:session][:password])
          log_in user
          render html: "the user id for the session is : " + user.id.to_s
          #render html: "correct login"            
      else
          flash.now[:danger] = "Invalid password or login. Try agian."
          render 'new'
          #render html: "incorrect login"
      end
  end

  def destroy
  end
  
end