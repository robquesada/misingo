class Breed < ActiveRecord::Base
  has_many :pets
  belongs_to :animal_type

  delegate :name, to: :animal_type, prefix: true
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
