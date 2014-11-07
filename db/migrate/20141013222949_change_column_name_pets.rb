class ChangeColumnNamePets < ActiveRecord::Migration
  def change
    rename_column :pets, :id_animal, :id_animal_type
  end
end
