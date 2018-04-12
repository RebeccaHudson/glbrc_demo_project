class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello_world_action
      render html: "hello world first action."
  end
 
  def redirect_to_login
      redirect_to login_path
  end
 
  include SessionsHelper

end
