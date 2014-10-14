class AddIdBreedToPet < ActiveRecord::Migration
  def change
    remove_column :animal_types, :id_breed
    add_column :pets, :id_breed, :integer
  end
end
