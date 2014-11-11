require 'rails_helper'

describe PetsController, "validations" do

  before :each do
    sign_in FactoryGirl.create(:user)
  end

  context "render templates" do
    it { expect(get :index).to be_success }
    it { expect(get :new).to render_template("new") }
  end
  
  context "create pet with valid attributes" do
    subject { post :create, pet: FactoryGirl.attributes_for(:pet) }
    it { expect{subject}.to change(Pet,:count).by(1) }
    it { expect(subject).to redirect_to new_pet_lost_report_path(Pet.last.id) }
  end

  context "create pet with invalid attributes" do
    subject { post :create, pet: FactoryGirl.attributes_for(:invalid_pet) }
    it { expect{subject}.to_not change(Pet,:count) }
    it { expect(subject.request.flash[:error]).to be_present }
    it { expect(subject).to render_template :new } 
  end

  context "update pet with valid params" do
    let(:new_attributes) { FactoryGirl.build(:pet, name: 'Popi').attributes.symbolize_keys }
    it "updates the requested pet", focus: true do
      pet = Pet.create! FactoryGirl.build(:pet).attributes.symbolize_keys
      put :update, {id: pet.to_param, pet: new_attributes}
      pet.reload
      expect(assigns(:pet).attributes.symbolize_keys[:name]).to eq(new_attributes[:name])
    end
  end

  context "update pet with invalid params" do
    let(:new_attributes) { FactoryGirl.build(:pet, name: 'Popi123').attributes.symbolize_keys }
    it "not update the requested pet", focus: true do
      pet = Pet.create! FactoryGirl.build(:pet).attributes.symbolize_keys
      put :update, {id: pet.to_param, pet: new_attributes}
      pet.reload
      expect(response.flash[:error]).to be_present
      expect(response).to render_template :edit
    end
  end

end
