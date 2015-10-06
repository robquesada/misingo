require 'rails_helper'

describe LostReportsController do
  login_user
  let(:pet) { FactoryGirl.create(:pet) }

  describe 'GET new' do
    it 'renders the new template' do
      expect(get :new, pet_id: pet.id).to render_template('new')
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      expect(get :show, pet_id: pet.id).to render_template('show')
    end
  end

  describe 'POST create' do
    context 'create lost report with valid attributes' do
      subject { post :create, pet_id: pet.id, lost_report: FactoryGirl.attributes_for(:lost_report) }

      it 'creates a new lost report' do
        expect{ subject }.to change(LostReport, :count).by(1)
      end

      it 'redirects to show lost report template' do
        expect(subject).to redirect_to pet_lost_report_path(pet.id)
      end
    end

    context 'create lost report with invalid attributes' do
      subject { post :create, pet_id: pet.id, lost_report: FactoryGirl.attributes_for(:invalid_lost_report) }

      it 'does not create a new lost report' do
        expect{ subject }.to_not change(LostReport, :count)
      end

      it 'adds errors messages' do
        expect(subject.request.flash[:error]).to be_present
      end

      it 'renders new template' do
        expect(subject).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:pet) { FactoryGirl.create(:pet, user: subject.current_user) }
    let(:lost_report) { FactoryGirl.create(:lost_report, pet_id: pet.id) }
    let(:new_attributes) { { address: 'Guadalupe' } }

    before do
      put :update, { pet_id: pet.id, id: lost_report.to_param, lost_report: new_attributes }
      lost_report.reload
    end

    context 'when lost report is not owned by the user' do
      let(:user_not_owner) { FactoryGirl.create(:user) }
      let(:pet) { FactoryGirl.create(:pet, user: user_not_owner) }

      it 'redirects to home page' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when lost report is owned by the user' do
      context 'update lost report with valid attributes' do
        it 'updates the requested pet' do
          expect(assigns(:lost_report)).to have_attributes(new_attributes)
        end
      end

      context 'update lost report with invalid attributes' do
        let(:new_attributes) { { phone_numbers: ['123'] } }

        it 'does not update the requested pet' do
          expect(lost_report.phone_numbers).not_to eq(['123'])
        end

        it 'adds errors messages' do
          expect(response.flash[:error]).to be_present
        end

        it 'renders edit template' do
          expect(response).to render_template :edit
        end
      end
    end
  end
end
