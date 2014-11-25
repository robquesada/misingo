require 'rails_helper'

describe UsersController do
  login_user

  describe 'GET index' do
    it 'have a current user' do
      expect(subject.current_user).to_not be_nil
    end

    it 'assigns pets from the current user' do
      subject.current_user.pets = [FactoryGirl.create(:pet)]
      get :index
      expect(assigns(:pets)).to eq(subject.current_user.pets)
    end

    it 'renders the index template' do
      expect(get :index).to render_template('index')
    end
  end
end
