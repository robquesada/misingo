require 'rails_helper'

describe UsersController do
  login_user

  describe 'GET index' do
    it 'have a current user' do
      expect(subject.current_user).to_not be_nil
    end

    it 'assigns lost reports from the current user' do
      subject.current_user.lost_reports = [FactoryGirl.create(:lost_report)]
      get :index
      expect(assigns(:lost_reports)).to eq(subject.current_user.lost_reports)
    end

    it 'renders the index template' do
      expect(get :index).to render_template('index')
    end
  end
end
