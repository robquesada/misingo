class Breed < ActiveRecord::Base
  has_many :pets
  belongs_to :animal_type
end