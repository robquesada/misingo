class AnimalType < ActiveRecord::Base
  has_many :pets
  has_many :breeds
end
