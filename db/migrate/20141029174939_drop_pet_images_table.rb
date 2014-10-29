class DropPetImagesTable < ActiveRecord::Migration
  def change
  	drop_table :pet_images
  end
end
