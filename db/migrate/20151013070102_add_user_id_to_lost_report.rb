class AddUserIdToLostReport < ActiveRecord::Migration
  def change
    add_column :lost_reports, :user_id, :integer
  end
end
