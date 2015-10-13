FactoryGirl.define do
  factory :animal_type do
    name ['Perro', 'Gato'].sample
  end
end

# == Schema Information
#
# Table name: animal_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#
