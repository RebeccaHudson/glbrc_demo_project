class AddSortToUserApps < ActiveRecord::Migration[5.1]
  def change
    add_column :user_apps, :sort, :integer
  end
end
