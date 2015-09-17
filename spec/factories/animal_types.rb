FactoryGirl.define do
  factory :animal_type do
    name 'Perro'
  end
end

# == Schema Information
#
# Table name: animal_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
