class UserAppsController < ApplicationController
  def add
       @user_id = session[:user_id]
       all_apps = Application.all
       apps_user_has = []
       User.find(@user_id).user_apps.each do |uapp| 
          apps_user_has << Application.find(uapp.link_id)
       end 
       @can_be_added = all_apps - apps_user_has
  end

  def add_app
     @user_id = session[:user_id]
     @id_of_app_to_add =  params[:app_to_add][:app_to_add].to_i
     @app_to_add = Application.find(@id_of_app_to_add) 
     if !@app_to_add.nil?
         #factor out the sanity check here into a cleaner validation.
         if UserApp.where(user_id: @user_id, link_id: @id_of_app_to_add).empty?
             puts "can add user app"
             u = UserApp.create(user_id:@user_id, link_id:@id_of_app_to_add ) 
             u.save 
         end
     end
     redirect_to user_apps_add_url
  end


  def add_default(app)
     @user_id = session[:user_id]
     @app_id = app.id
     puts "adding default app" + @app_id.to_s + " user " + @user_id.to_s

     if @app_id.nil?
       raise Exception
     #  #clean this part up if possible.
     end 

     if UserApp.where(user_id: @user_id, link_id: @app_id).empty?
         puts "can add user app"
         u = UserApp.create(user_id:@user_id, link_id:@app_id ) 
         u.save 
     else
         #do not allow this to be added.
         puts "can not add user app"
     end


  end

  def remove
       @user_id = session[:user_id]
       @apps_user_has = []
       User.find(@user_id).user_apps.each do |uapp| 
          @apps_user_has << Application.find(uapp.link_id)
       end 
  end

  def reorder
  end

  def use_defaults
       puts "using defaults *********************"
       Application.all.each do |one_app|
          puts "checking out one app ********************"
          if one_app.is_default?
             add_default(one_app)
  #           #see that it's added
  #        else
  #           puts "not default"
  #           #see that it's not in there 
          end
       end
       redirect_to session[:return_to] ||= request.referer
  end

 end

