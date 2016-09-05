class AddFoundToLostReport < ActiveRecord::Migration
  def change
    add_column :lost_reports, :found, :boolean, default: false
  end
end
