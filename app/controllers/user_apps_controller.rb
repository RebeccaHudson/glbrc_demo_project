class UserAppsController < ApplicationController
  def add
       @user_id = session[:user_id]
       @user = User.find(@user_id)
       all_apps = Application.all
       apps_user_has = []
       User.find(@user_id).user_apps.each do |uapp| 
          apps_user_has << Application.find(uapp.link_id)
       end 
       @can_be_added = all_apps - apps_user_has
  end

  def remove_app
     @user_id = session[:user_id]
     @id_of_app_to_remove = params[:app_to_remove][:app_to_remove].to_i
     to_remove = UserApp.where(user_id: @user_id, link_id: @id_of_app_to_remove).first
     to_remove.destroy
     redirect_to user_apps_remove_url
  end


  def add_app
     @user_id = session[:user_id]
     @id_of_app_to_add =  params[:app_to_add][:app_to_add].to_i
     u = UserApp.create(user_id:@user_id, link_id:@id_of_app_to_add ) 
     u.save 
     redirect_to user_apps_add_url
  end


  def add_default(app)
     #@user_id = session[:user_id]
     @app_id = app.id
     u = UserApp.create(user_id:@user_id, link_id:@app_id ) 
     u.save   #creation fails if it's a duplicate
  end

  def remove
       @user_id = session[:user_id]
       @user = User.find(@user_id)
       @apps_user_has = []
       User.find(@user_id).user_apps.each do |uapp| 
          @apps_user_has << Application.find(uapp.link_id)
       end 
  end

  def use_defaults
       @user_id = session[:user_id]
       Application.all.each do |one_app|
          if one_app.is_default?
             add_default(one_app)
          else
              user_has = UserApp.where(user_id: @user_id, link_id: one_app.id) 
              if !user_has.empty?
                  user_has.first.destroy
              end
          end
       end
       redirect_to request.referer
  end

 end

