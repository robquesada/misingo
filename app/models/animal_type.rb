class AnimalType < ActiveRecord::Base
    belongs_to :pet
    has_one :breed
end
