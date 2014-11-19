require 'rails_helper'

describe Users::OmniauthCallbacksController do

  let(:facebook_user) { FactoryGirl.create(:user) }
  let(:facebook_non_persisted_user) { FactoryGirl.build(:user) }

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = facebook_user_hash
  end

  describe "facebook authentication" do
    
    context "with a valid user" do
      before { allow(User).to receive(:from_omniauth).and_return(facebook_user) }
      
      it "signs in and redirects the user" do
        expect(controller).to receive(:sign_in_and_redirect).with(
          facebook_user,
          event: :authentication
        ).and_call_original
        get :facebook
      end

      it "sets success flash messages" do
        expect(controller).to receive(:set_flash_message).with(
          :notice,
          :success,
          :kind => "Facebook"
        ).and_call_original
        get :facebook
      end
    end

    context "with a non persisted user" do
      before { allow(User).to receive(:from_omniauth).and_return(facebook_non_persisted_user) }
      
      it "saves session in devise module" do
        get :facebook
        expect(session["devise.facebook_data"]).to eq(facebook_user_hash)
      end

      it "redirects to a new user registration url" do
        get :facebook
        expect(response).to redirect_to(new_user_registration_url)
      end
    end
  end

end
