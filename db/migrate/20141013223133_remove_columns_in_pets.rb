class RemoveColumnsInPets < ActiveRecord::Migration
  def change
    remove_column :pets, :kind_of_animal
    remove_column :pets, :breed
  end
end
