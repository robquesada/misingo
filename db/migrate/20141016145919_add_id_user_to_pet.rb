class AddIdUserToPet < ActiveRecord::Migration
  def change
    add_column :pets, :id_user, :integer
  end
end
