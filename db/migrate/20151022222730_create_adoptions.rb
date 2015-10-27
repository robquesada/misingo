class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.text :description
      t.string :contact
      t.text :phone_numbers
      t.integer :province_id
      t.integer :pet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
