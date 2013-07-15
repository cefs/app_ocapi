class ChangeDefaultValueToUsersRole < ActiveRecord::Migration
  def change
    change_column_default :users, :role, 'visitor'
  end
end
