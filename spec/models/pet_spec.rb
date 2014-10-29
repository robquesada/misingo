require 'rails_helper'

describe Pet, "validations" do
	it "validates all the expected fields" do
		pet = Pet.new(name: "Bobby",
					  animal_type_id: 1,
					  breed_id: 1,
					  sex: "Macho")
	
		expect(pet.name).to eq "Bobby"
		expect(pet).to be_valid
	end

	it "validates pet name" do
		pet = Pet.new(name: 123)
	
		expect(pet).to_not be_valid
	end
end