class RenameUserColumnFromPet < ActiveRecord::Migration
  def change
    rename_column :pets, :id_user, :user_id
  end
end
