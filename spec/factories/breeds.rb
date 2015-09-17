FactoryGirl.define do
  factory :breed do
    name 'Zaguate'

    after(:create) do |breed|
      breed.animal_type = create(:animal_type)
    end
  end
end

# == Schema Information
#
# Table name: breeds
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  animal_type_id :integer
#
