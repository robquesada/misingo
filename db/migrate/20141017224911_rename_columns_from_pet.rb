class RenameColumnsFromPet < ActiveRecord::Migration
  def change
    rename_column :pets, :id_animal_type, :animal_type_id
    rename_column :pets, :id_breed, :breed_id
  end
end
