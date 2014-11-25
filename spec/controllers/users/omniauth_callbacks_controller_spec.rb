require 'rails_helper'

describe Users::OmniauthCallbacksController do
  let(:facebook_user) { FactoryGirl.create(:user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = facebook_user_hash
  end

  describe 'facebook authentication' do
    before { allow(User).to receive(:from_omniauth).and_return(facebook_user) }

    context 'with a valid user' do
      it 'signs in and redirects the user' do
        expect(controller).to receive(:sign_in_and_redirect).with(
          facebook_user,
          event: :authentication
        ).and_call_original
        get :facebook
      end
    end

    context 'with a non persisted user' do
      before { allow(facebook_user).to receive(:persisted?).and_return(false) }

      it 'saves session in devise module' do
        get :facebook
        expect(session['devise.facebook_data']).to eq(facebook_user_hash)
      end

      it 'redirects to a new user registration url' do
        get :facebook
        expect(response).to redirect_to(new_user_registration_url)
      end
    end
  end
end
