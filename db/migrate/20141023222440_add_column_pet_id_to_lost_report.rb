class AddColumnPetIdToLostReport < ActiveRecord::Migration
  def change
    add_column :lost_reports, :pet_id, :integer
  end
end
