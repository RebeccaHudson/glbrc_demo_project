class HomepageController < ApplicationController
  def show_home
      if !logged_in?
          redirect_to login_url
      end
      @user = User.find(session[:user_id])
      user_apps_to_show = @user.user_apps.order(:sort).all
      @apps_to_show = []
      @user_apps_to_show = []   
      #returns instances of UserApp rather than Application

      user_apps_to_show.each do | one_user_app |
         @user_apps_to_show << one_user_app
         @apps_to_show << Application.find(one_user_app.link_id)
      end
  end
end
