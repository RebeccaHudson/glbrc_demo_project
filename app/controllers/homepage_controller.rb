class HomepageController < ApplicationController
  def show_home
      @foobar = "I have passed in some data"
      if !logged_in?
          redirect_to login_url
      end
      @user_shown = session[:user_id].to_s
      @user = User.find(session[:user_id])
      user_apps_to_show = @user.user_apps
      #use: .order(:order_for_user) on the list of apps.
      @apps_to_show = []
      user_apps_to_show.each do | one_user_app |
         @apps_to_show << Application.find(one_user_app.link_id)
      end
  end
end
