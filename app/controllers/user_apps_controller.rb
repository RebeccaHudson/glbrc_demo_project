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

  def remove_app
     @user_id = session[:user_id]
     @id_of_app_to_remove = params[:app_to_remove][:app_to_remove].to_i
     app_to_remove = Application.find(@id_of_app_to_remove)
     if !app_to_remove.nil?
         to_remove = UserApp.where(user_id: @user_id, link_id: @id_of_app_to_remove).first
         to_remove.destroy
     end
     redirect_to user_apps_remove_url
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
     #@user_id = session[:user_id]
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
       @user_id = session[:user_id]
       puts "using defaults *********************"
       Application.all.each do |one_app|
          puts "checking out one app ********************"
          if one_app.is_default?
             add_default(one_app)
          else
              user_has = UserApp.where(user_id: @user_id, link_id: one_app.id) 
              if !user_has.empty?
                  user_has.first.destroy
              end
          end
       end
       redirect_to session[:return_to] ||= request.referer
  end

 end

