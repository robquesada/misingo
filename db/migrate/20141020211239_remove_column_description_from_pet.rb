class RemoveColumnDescriptionFromPet < ActiveRecord::Migration
  def change
    remove_column :pets, :description, :string
  end
end
