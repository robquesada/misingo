class AddFoundColumnToLostReportsTable < ActiveRecord::Migration
  def change
    add_column :lost_reports, :found, :boolean, default: false, null: false
  end
end
