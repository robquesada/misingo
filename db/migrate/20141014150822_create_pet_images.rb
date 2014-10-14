class CreatePetImages < ActiveRecord::Migration
  def change
    create_table :pet_images do |t|

      t.timestamps
    end
  end
end
