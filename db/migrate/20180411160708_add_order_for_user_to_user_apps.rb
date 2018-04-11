class AddOrderForUserToUserApps < ActiveRecord::Migration[5.1]
  def change
    add_column :user_apps, :order_for_user, :integer
  end
end
