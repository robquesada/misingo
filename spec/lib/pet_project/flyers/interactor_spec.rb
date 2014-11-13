require 'rails_helper'

describe PetProject::Flyers::Interactor do

  let(:pet) { FactoryGirl.create(:pet) }
  let(:lost_report) { FactoryGirl.create(:lost_report, pet: pet) }

  let(:flyer_info) { { pet_name: 'Pipo' } }
  let(:interactor) { PetProject::Flyers::Interactor.new }
  
  describe "generating info" do
    it "receives pet and lost report and return hash with information" do
      expect(interactor).to receive(:generate_info).with(pet, lost_report).and_return(flyer_info)
      interactor.generate_info(pet, lost_report)
    end
  end

end
