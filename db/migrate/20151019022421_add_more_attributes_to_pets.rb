class AddMoreAttributesToPets < ActiveRecord::Migration
  def change
    add_column :pets, :castrated, :boolean
    add_column :pets, :age, :integer
    add_column :pets, :size, :string
  end
end
