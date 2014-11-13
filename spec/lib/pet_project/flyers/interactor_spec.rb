require 'rails_helper'

describe PetProject::Flyers::Interactor do

  let(:pet) { FactoryGirl.create(:pet) }
  let(:lost_report) { FactoryGirl.create(:lost_report, pet: pet) }

  let(:flyer_info) { { pet_name: 'Pipo' } }
  let(:presenter) { double("PetProject::Flyers::Presenter", generate_info: flyer_info) }
  let(:template) { double("PetProject::Flyers::Templates::Default", generate_flyer: "Flyer") }

  let(:interactor) { PetProject::Flyers::Interactor.new(pet, lost_report) }

  describe "generating the flyer" do
    before do
      allow(PetProject::Flyers::Presenter).to receive(:new) { presenter }
      allow(PetProject::Flyers::Templates::Default).to receive(:new) { template }
    end

    after do
      interactor.generate_flyer
    end

    it "creates an interactor" do
      expect(PetProject::Flyers::Presenter).to receive(:new)
    end

    it "receive the flyer info from interactor" do
      expect(presenter).to receive(:generate_info).with(pet, lost_report)
    end
    
    it "creates the template" do
      expect(PetProject::Flyers::Templates::Default).to receive(:new).with(flyer_info)
    end
    
    it "generates the flyer" do
      expect(template).to receive(:generate_flyer)
    end
  end

end
