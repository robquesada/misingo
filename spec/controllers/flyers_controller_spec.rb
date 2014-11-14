require 'rails_helper'

describe FlyersController do
  
  describe "GET show" do
    let(:lost_report) { FactoryGirl.create(:lost_report) }
    let(:pet) { FactoryGirl.create(:pet, lost_report: lost_report) }

    let(:flyer) { double("Flyer", to_blob: "12312jklasdjasd812") }
    let(:interactor) { double("PetProject::Flyers::Interactor", generate_flyer: flyer) }

    before do
      allow(PetProject::Flyers::Interactor).to receive(:new) { interactor }
    end

    it "finds the pet" do
      get :show, pet_id: pet.id
      expect(assigns(:pet)).to eq(pet)
    end

    it "assigns the lost report" do
      get :show, pet_id: pet.id
      expect(assigns(:lost_report)).to eq(lost_report)
    end

    describe "generating the flyer" do
      it "creates an interactor" do
        expect(PetProject::Flyers::Interactor).to receive(:new).with(lost_report)
        get :show, pet_id: pet.id
      end

      it "generates the flyer" do
        expect(interactor).to receive(:generate_flyer)
        get :show, pet_id: pet.id
      end
    end

    it "sends the data with the flyer" do
      expect(controller).to receive(:send_data).with(
        flyer.to_blob,
        stream: 'false',
        filename: 'flyer.jpg',
        type: 'image/jpeg',
        disposition: 'inline'
      ).and_call_original

      get :show, pet_id: pet.id
    end
  end
end
