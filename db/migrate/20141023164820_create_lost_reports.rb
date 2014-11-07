class CreateLostReports < ActiveRecord::Migration
  def change
    create_table :lost_reports do |t|
      t.string :province
      t.text :adress
      t.integer :reward
      t.string :owner_string
      t.text :description

      t.timestamps
    end
  end
end
