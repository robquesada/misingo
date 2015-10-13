require 'rails_helper'

describe InvitesController do

  describe "POST create" do
    context "when the params are valid" do
      let(:invite_params) { { email: "a@a.com", comment: "A comment" } }

      it "creates a new invite" do
        expect { post :create, invite: invite_params }.to change(Invite, :count).by(1)
      end

      it "adds a flash notice" do
        post :create, invite: invite_params
        expect(flash[:notice]).to eq "Gracias por colaborar con Misingo"
      end

      it "redirects to home" do
        post :create, invite: invite_params
        expect(response).to redirect_to(root_path)
      end
    end

    context "when the params are invalid" do
      it "adds the flash error messages" do
        post :create, invite: { email: nil }
        expect(flash[:error]).to be_present
      end

      it "redirects to home" do
        post :create, invite: { email: nil }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
