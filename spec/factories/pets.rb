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

# == Schema Information
#
# Table name: pets
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  sex                 :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  user_id             :integer
#  breed_id            :integer
#
