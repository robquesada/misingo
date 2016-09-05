class AddAdoptedToAdoption < ActiveRecord::Migration
  def change
    add_column :adoptions, :adopted, :boolean, default: false
  end
end
