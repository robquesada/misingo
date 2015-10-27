include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :pet do
    name 'Pipo'
    sex 'Hembra'
    breed
    avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/#{breed.try(animal_type_name) || "Perro" }.jpg", 'image/jpg') }
  end

  factory :invalid_pet, parent: :user do
    avatar nil
  end
end

# == Schema Information
#
# Table name: pets
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime
#  updated_at          :datetime
#  sex                 :string
#  breed_id            :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  castrated           :boolean
#  age                 :string
#  size                :string
#
