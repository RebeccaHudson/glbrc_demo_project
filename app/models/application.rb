class Application < ApplicationRecord
    has_many :user_apps

    def is_default?
        return default_status == "Yes"
    end

    def add_for_user_path
        #we called it!
        raise Exception
    end

end
