class RemoveColumnProvinceFromLostReport < ActiveRecord::Migration
  def change
  	remove_column :lost_reports, :province, :string
  end
end
