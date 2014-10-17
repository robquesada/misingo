class AddIdBreeToAnimalType < ActiveRecord::Migration
  def change
    add_column :animal_types, :id_breed, :integer
  end
end
