class Application < ApplicationRecord
    has_many :user_apps

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :link, presence: true
    validates :default_status, presence: true

    validates_associated :user_apps


    def is_default?
        return default_status == "Yes"
    end

end
