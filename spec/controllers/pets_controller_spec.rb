require 'rails_helper'

describe PetsController do

  before :each do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET index" do
    it "renders index template" do
      expect(get :index).to be_success
    end
  end

  describe "GET new" do
    it "renders new template" do
      expect(get :new).to render_template("new")
    end
  end

  describe "POST create" do
    context "pet with valid attributes" do
      subject { post :create, pet: FactoryGirl.attributes_for(:pet) }
      
      it "has one new pet" do
        expect{subject}.to change(Pet,:count).by(1)
      end
      
      it "redirects to new lost report form" do
        expect(subject).to redirect_to new_pet_lost_report_path(Pet.last.id)
      end
    end  

    context "pet with invalid attributes" do
      subject { post :create, pet: FactoryGirl.attributes_for(:invalid_pet) }
      
      it "does not has a new pet" do
        expect{subject}.to_not change(Pet,:count)
      end
      
      it "adds the error messages" do
        expect(subject.request.flash[:error]).to be_present
      end
      
      it "renders new template" do
        expect(subject).to render_template :new
      end
    end
  end

  describe "PUT update" do
    let(:pet) { FactoryGirl.create(:pet) }

    before do
      put :update, { id: pet.id, pet: new_attributes }
      pet.reload
    end

    context "pet with valid attributes" do
      let(:new_attributes) { { name: 'Popi' } }

      it "updates the requested pet" do  
        expect(assigns(:pet)).to have_attributes(new_attributes)
      end
    end

    context "pet with invalid attributes" do
      let(:new_attributes) { { name: 'Popi123' } }

      it "does not update the requested pet" do
        expect(pet.name).not_to eq('Popi123')
      end

      it "adds the error messages" do
        expect(response.flash[:error]).to be_present
      end

      it "renders edit template" do
        expect(response).to render_template :edit
      end
    end
  end
end
