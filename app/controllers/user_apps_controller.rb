class UserAppsController < ApplicationController
  def add
        @user_id = session[:user_id]
        #@app_id = params[:app_id] if @app_id.nil?
        #if !@app_id.nil?
        #  raise Exception
        #  #clean this part up if possible.
        #end 
        #if UserApp.where(user_id: @user_id, link_id: @app_id).empty?
        #    puts "can add user app"
        #    u = UserApp.create(user_id:@user_id, link_id:@app_id ) 
        #    u.save 
        #else
        #    #do not allow this to be added.
        #    puts "can not add user app"
        #end
  end

  #can I overload the above method?
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

