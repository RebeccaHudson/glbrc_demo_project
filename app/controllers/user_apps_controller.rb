class UserAppsController < ApplicationController
  include UserAppsHelper
  def add
       set_user_and_app
       all_apps = Application.all
       apps_user_has = []
       @user.user_apps.each do |uapp| 
          apps_user_has << Application.find(uapp.link_id)
       end 
       @can_be_added = all_apps - apps_user_has
  end

  def remove_app
     set_user_and_app
     to_remove = UserApp.where(user_id: @user.id, link_id: @app_id).first
     to_remove.destroy
     redirect_to user_apps_remove_url
  end


  def add_app
     set_user_and_app
     u = UserApp.create(user_id:@user.id, link_id: @app_id ) 
     u.save 
     redirect_to user_apps_add_url
  end


  def add_default(app)
     u = UserApp.create(user_id:@user.id, link_id:app.id ) 
     u.save   #creation fails if it's a duplicate
  end

  def remove
       set_user_and_app
       @apps_user_has = []
       @user.user_apps.each do |uapp| 
          @apps_user_has << Application.find(uapp.link_id)
       end 
  end

  def use_defaults
       set_user_and_app
       Application.all.each do |one_app|
          if one_app.is_default?
             add_default(one_app)
          else
              user_has = UserApp.where(user_id: @user.id, link_id: one_app.id) 
              if !user_has.empty?
                  user_has.first.destroy
              end
          end
       end
       redirect_to request.referer
  end

 end

