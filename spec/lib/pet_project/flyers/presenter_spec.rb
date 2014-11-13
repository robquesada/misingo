require 'rails_helper'

describe PetProject::Flyers::Presenter do

  let(:pet) { FactoryGirl.create(:pet) }
  let(:lost_report) { FactoryGirl.create(:lost_report, pet: pet) }

  let(:flyer_info) { { pet_name: 'Pipo' } }
  let(:interactor) { double("PetProject::Flyers::Interactor", generate_info: flyer_info) }
  let(:template) { double("PetProject::Flyers::Templates::Default", generate_flyer: "Flyer") }

  let(:presenter) { PetProject::Flyers::Presenter.new(pet, lost_report) }

  describe "generating the flyer" do
    before do
      allow(PetProject::Flyers::Interactor).to receive(:new) { interactor }
      allow(PetProject::Flyers::Templates::Default).to receive(:new) { template }
    end

    after do
      presenter.generate_flyer
    end

    it "creates an interactor" do
      expect(PetProject::Flyers::Interactor).to receive(:new)
    end

    it "receive the flyer info from interactor" do
      expect(interactor).to receive(:generate_info).with(pet, lost_report)
    end
    
    it "creates the template" do
      expect(PetProject::Flyers::Templates::Default).to receive(:new).with(flyer_info)
    end
    
    it "generates the flyer" do
      expect(template).to receive(:generate_flyer)
    end
  end

end
