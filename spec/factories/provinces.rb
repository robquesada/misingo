FactoryGirl.define do
  factory :province do
    name 'Alajuela'
  end
end

# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
