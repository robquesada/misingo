class ChangeColumnNameFromLostReport < ActiveRecord::Migration
  def change
  	rename_column :lost_reports, :adress, :address
  end
end
