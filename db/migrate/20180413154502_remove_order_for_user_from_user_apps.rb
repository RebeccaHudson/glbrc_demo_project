class RemoveOrderForUserFromUserApps < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_apps, :order_for_user, :integer
  end
end
