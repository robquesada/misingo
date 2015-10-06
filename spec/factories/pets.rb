include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :pet do
    name 'Pipo'
    avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/cat.jpg", 'image/jpg') }
    sex 'Hembra'
    breed
  end

  factory :invalid_pet, parent: :user do
    avatar nil
  end
end
