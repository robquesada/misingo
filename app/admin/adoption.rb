ActiveAdmin.register Adoption do
  permit_params :description, :contact, :province_id, :pet_id, :user_id,
    :adopted
end
