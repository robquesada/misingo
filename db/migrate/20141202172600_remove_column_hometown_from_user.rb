class RemoveColumnHometownFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :hometown, :string
  end
end
