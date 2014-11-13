require 'rails_helper'

describe PetProject::Flyers::Presenter do

  let(:pet) { FactoryGirl.create(:pet) }
  let(:lost_report) { FactoryGirl.create(:lost_report, pet: pet) }

  let(:flyer_info) { { pet_name: 'Pipo' } }
  let(:presenter) { PetProject::Flyers::Presenter.new }
  
  describe "generating info" do
    it "receives pet and lost report and return hash with information" do
      expect(presenter).to receive(:generate_info).with(pet, lost_report).and_return(flyer_info)
      presenter.generate_info(pet, lost_report)
    end
  end

end
