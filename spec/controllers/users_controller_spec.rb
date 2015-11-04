require 'rails_helper'

describe UsersController do
  login_user

  describe 'GET show' do
    let(:user) { FactoryGirl.create :user }

    it 'sets @user' do
      get :show, id: user.id
      expect(assigns(:user)).not_to be_nil
    end

    it 'assigns lost reports from the user' do
      user.lost_reports = [FactoryGirl.create(:lost_report)]
      user.adoptions = [FactoryGirl.create(:adoption)]
      get :show, id: user.id
      expect(assigns(:pet_reports)).to eq(user.adoptions + user.lost_reports)
    end

    it 'renders the show template' do
      expect(get :show, id: user.id).to render_template('show')
    end
  end

  describe 'GET edit' do
    it 'has a current user' do
      expect(subject.current_user).to_not be_nil
    end

    it 'renders the edit template' do
      expect(get :edit, id: subject.current_user.id).to render_template('edit')
    end
  end

  describe 'PUT update' do
    let(:new_attributes) { { name: 'New Name' } }

    before do
      put :update, { id: subject.current_user.id, user: new_attributes }
      subject.current_user.reload
    end

    it 'has a current user' do
      expect(subject.current_user).to_not be_nil
    end

    it 'updates the user' do
      expect(subject.current_user).to have_attributes(new_attributes)
    end

    it 'redirects to the user profile page' do
      expect(response).to redirect_to user_path(subject.current_user)
    end
  end
end
