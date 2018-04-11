class Application < ApplicationRecord
    has_many :user_apps

    def is_default?
        return default_status == "Yes"
    end

end
