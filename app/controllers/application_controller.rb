class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello_world_action
      render html: "hello world first action."
  end


  #deprecate: this got put into the Homepage controller.
  def show_homepage
      active_user_id = session[:user_id].to_s
      render html: "homepage for user " + active_user_id
  end

 
  include SessionsHelper

end
