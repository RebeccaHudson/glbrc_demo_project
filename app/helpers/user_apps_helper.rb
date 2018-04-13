module UserAppsHelper

    def set_user_and_app
        @user = User.find(session[:user_id])
        
        if params[:app_to_remove] 
            @app_id = params[:app_to_remove][:app_to_remove].to_i
        elsif params[:app_to_add]
            @app_id = params[:app_to_add][:app_to_add].to_i
        end
        
    end
end
