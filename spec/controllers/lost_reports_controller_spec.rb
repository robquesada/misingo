require 'rails_helper'

describe LostReportsController, "validations" do

  before :each do
    @pet = FactoryGirl.create(:pet)
  end

  context "render templates" do
    subject { post :create, pet_id: @pet.id, lost_report: FactoryGirl.attributes_for(:lost_report) }
    it { expect(subject).to redirect_to pet_lost_report_path(@pet) }
  end
  
  context "create lost report with valid attributes" do
    subject { post :create, pet_id: @pet.id, lost_report: FactoryGirl.attributes_for(:lost_report) }
    it { expect{subject}.to change(LostReport,:count).by(1) }
    it { expect(subject).to redirect_to pet_lost_report_path(@pet.id) }
  end

  context "create lost report with invalid attributes" do
    subject { post :create, pet_id: @pet.id, lost_report: FactoryGirl.attributes_for(:invalid_lost_report) }
    it { expect{subject}.to_not change(LostReport,:count) }
    it { expect(subject.request.flash[:error]).to be_present }
    it { expect(subject).to render_template :new }
  end

  context "update lost report with valid params" do
    let(:new_attributes) { FactoryGirl.build(:lost_report, pet_id: @pet.id, address: 'Guadalupe').attributes.symbolize_keys }
    it "updates the requested pet", focus: true do
      lost_report = LostReport.create! FactoryGirl.build(:lost_report, pet_id: @pet.id).attributes.symbolize_keys
      put :update, {pet_id: @pet.id, id: lost_report.to_param, lost_report: new_attributes}
      lost_report.reload
      expect(assigns(:lost_report).attributes.symbolize_keys[:name]).to eq(new_attributes[:name])
    end
  end

  context "update lost report with invalid params" do
    let(:new_attributes) { FactoryGirl.build(:lost_report, pet_id: @pet.id, phone_numbers: ["123"]).attributes.symbolize_keys }
    it "updates the requested pet", focus: true do
      lost_report = LostReport.create! FactoryGirl.build(:lost_report, pet_id: @pet.id).attributes.symbolize_keys
      put :update, {pet_id: @pet.id, id: lost_report.to_param, lost_report: new_attributes}
      lost_report.reload
      expect(response.flash[:error]).to be_present
      expect(response).to render_template :edit
    end
  end

end
