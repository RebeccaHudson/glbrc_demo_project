class UserApp < ApplicationRecord
    belongs_to :user

    #use has_one if this relation doesn't work:
    has_one :application

    include RailsSortable::Model
    set_sortable :sort  # Indicate a sort column

    #validate that each of the referred objects can be found?
end
