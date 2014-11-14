class Breed < ActiveRecord::Base
  has_many :pets
  belongs_to :animal_type

  delegate :name, to: :animal_type, prefix: true
end
