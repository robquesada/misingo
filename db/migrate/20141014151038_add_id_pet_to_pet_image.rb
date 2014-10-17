class AddIdPetToPetImage < ActiveRecord::Migration
  def change
    add_column :pet_images, :id_pet, :integer
  end
end
