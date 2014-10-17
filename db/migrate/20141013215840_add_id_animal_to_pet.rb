class AddIdAnimalToPet < ActiveRecord::Migration
  def change
    add_column :pets, :id_animal, :integer
  end
end
