class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_to_login
      redirect_to login_path
  end
 
  include SessionsHelper

end
