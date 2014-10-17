class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind_of_animal
      t.string :breed
      t.string :description

      t.timestamps
    end
  end
end
