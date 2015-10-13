FactoryGirl.define do
  factory :breed do
    name 'Zaguate'
    animal_type
  end
end

# == Schema Information
#
# Table name: breeds
#
#  id             :integer          not null, primary key
#  name           :string
#  created_at     :datetime
#  updated_at     :datetime
#  animal_type_id :integer
#
