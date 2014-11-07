class ChangeColumnNameFromLostReports < ActiveRecord::Migration
  def change
  	rename_column :lost_reports, :owner_string, :owner
  end
end
