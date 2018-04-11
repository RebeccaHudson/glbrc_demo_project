class HomepageController < ApplicationController
  def show_home
      @foobar = "I have passed in some data"
      if !logged_in?
          redirect_to login_url
      end
      @user_shown = session[:user_id].to_s
  end
end
