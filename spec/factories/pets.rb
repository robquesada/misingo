include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :pet do
    name 'Pipo'
    avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/cat.jpg", 'image/jpg') }
    sex 'Hembra'

    after(:create) do |pet|
      pet.breed = create(:breed)
    end
  end

  factory :invalid_pet, parent: :user do
    avatar nil
  end
end
