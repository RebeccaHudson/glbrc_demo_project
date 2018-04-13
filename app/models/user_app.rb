class UserApp < ApplicationRecord
    belongs_to :user
    has_one :application

    validates :user_id, presence: true
    validates :link_id, presence: true

    #each should have a unique pair of user_id, link_id.
    validates :link_id, uniqueness: { scope: :user_id }

    include RailsSortable::Model
    set_sortable :sort  

end
