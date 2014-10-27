class AddColumnProvinceIdToLostReports < ActiveRecord::Migration
  def change
  	add_column :lost_reports, :province_id, :integer
  end
end
