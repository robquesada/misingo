require 'rails_helper'

describe AdoptionsController do
  login_user
  let(:adoption) { FactoryGirl.create(:adoption) }

  describe 'GET #new' do
    before { get :new }

    it 'renders the new template' do
      expect(subject).to render_template('new')
    end

    it 'should assigns an adoption' do
      expect(assigns(:adoption)).to be_a_new(Adoption)
    end

    it 'should build a new pet' do
      expect(assigns(:adoption).pet).to be_a_new(Pet)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      expect(get :show, id: adoption.id).to render_template('show')
    end
  end

  describe 'POST #create' do
    context 'create adoption with valid attributes' do
      subject { post :create, adoption: FactoryGirl.attributes_for(:adoption) }

      it 'creates a new adoption' do
        expect{ subject }.to change(Adoption, :count).by(1)
      end

      it 'redirects to show adoption template' do
        expect(subject).to redirect_to adoption_path(Adoption.last)
      end
    end

    context 'create adoption with invalid attributes' do
      subject { post :create, adoption: FactoryGirl.attributes_for(:invalid_adoption) }

      it 'does not create a new lost report' do
        expect{ subject }.to_not change(Adoption, :count)
      end

      it 'adds errors messages' do
        expect(subject.request.flash[:error]).to be_present
      end

      it 'renders new template' do
        expect(subject).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let(:adoption) { FactoryGirl.create(:adoption, user: subject.current_user) }
    let(:new_attributes) { { address: 'Guadalupe' } }

    before do
      put :update, { id: adoption.to_param, adoption: new_attributes }
      adoption.reload
    end

    context 'when adoption is not owned by the user' do
      let(:user_not_owner) { FactoryGirl.create(:user) }
      let(:adoption) { FactoryGirl.create(:adoption, user: user_not_owner) }

      it 'redirects to home page' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when adoption is owned by the user' do
      context 'update adoption with valid attributes' do
        it 'updates the requested pet' do
          expect(assigns(:adoption)).to have_attributes(new_attributes)
        end
      end

      context 'update adoption with invalid attributes' do
        let(:new_attributes) { { phone_numbers: ['123'] } }

        it 'does not update the requested pet' do
          expect(adoption.phone_numbers).not_to eq(['123'])
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
