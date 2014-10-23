class AddColumnsToLostReport < ActiveRecord::Migration
  def change
  	add_column :lost_reports, :phone_number1, :string
	add_column :lost_reports, :phone_number2, :string
  end
end
