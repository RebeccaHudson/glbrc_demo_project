module UserAppsHelper

    def set_user_and_app
        @user = User.find(session[:user_id])
        
        if params[:app_to_remove] 
            puts "removing an app"
            @app_id = params[:app_to_remove][:app_to_remove].to_i
        elsif params[:app_to_add]
            @app_id = params[:app_to_add][:app_to_add].to_i
            puts "adding an app" + @app_id.to_s
        end
        
    end
end
