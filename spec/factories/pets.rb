include ActionDispatch::TestProcess

FactoryGirl.define do
  
  factory :pet do
    name "Pipo"
    avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/cat.jpg", "image/jpg") }
    breed_id 1
    sex "Hembra"
  end

  factory :invalid_pet, parent: :user do
    avatar nil
  end
end
