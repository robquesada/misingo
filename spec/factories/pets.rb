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
