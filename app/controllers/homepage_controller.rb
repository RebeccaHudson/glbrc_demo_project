class HomepageController < ApplicationController
  def show_home
      @foobar = "I have passed in some data"
      @user_shown = session[:user_id].to_s
  end
end
