class RemoveBreedIdFromPet < ActiveRecord::Migration
  def change
  	remove_column :pets, :animal_type_id, :integer
  	add_column :breeds, :animal_type_id, :integer
  end
end
