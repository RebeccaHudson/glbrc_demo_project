class UserAppsController < ApplicationController
  def add
        user_id = params[:uid] 
        app_name = params[:app_name]
        #UserApp.create(user_id:User.first.id.to_int, link_id: Application.first.id.to_int) 
	#@app = 
  end

  def remove
  end

  def reorder
  end
end
