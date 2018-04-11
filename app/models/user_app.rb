class UserApp < ApplicationRecord
    belongs_to :user

    #use has_one if this relation doesn't work:
    has_one :application

    #validate that each of the referred objects can be found?


end
