FactoryGirl.define do

  factory :adoption do
    contact 'Asociación Perro Feliz'
    description 'MyText'
    phone_numbers %w(12345678 12345678)
    pet
    province
    user
  end

  factory :invalid_adoption, parent: :adoption do
    phone_numbers ['', '']
  end

end

# == Schema Information
#
# Table name: adoptions
#
#  id            :integer          not null, primary key
#  description   :text
#  contact       :string
#  phone_numbers :text
#  province_id   :integer
#  pet_id        :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#
