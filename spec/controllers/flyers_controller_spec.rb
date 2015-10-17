require 'rails_helper'

describe FlyersController do
  describe 'GET #show' do
    let(:lost_report) { FactoryGirl.create(:lost_report) }
    let(:flyer) { double('Flyer', to_blob: '12312jklasdjasd812') }
    let(:interactor) { double('PetProject::Flyers::Interactor', generate_flyer: flyer) }

    before do
      allow(PetProject::Flyers::Interactor).to receive(:new) { interactor }
    end

    it 'assigns the lost report' do
      get :show, lost_report_id: lost_report.id
      expect(assigns(:lost_report)).to eq(lost_report)
    end

    describe 'generating the flyer' do
      it 'creates an interactor' do
        expect(PetProject::Flyers::Interactor).to receive(:new).with(lost_report)
        get :show, lost_report_id: lost_report.id
      end

      it 'generates the flyer' do
        expect(interactor).to receive(:generate_flyer)
        get :show, lost_report_id: lost_report.id
      end
    end

    it 'sends the data with the flyer' do
      expect(controller).to receive(:send_data).with(
        flyer.to_blob,
        stream: 'false',
        filename: 'flyer.jpg',
        type: 'image/jpeg',
        disposition: 'inline'
      ).and_call_original

      get :show, lost_report_id: lost_report.id
    end
  end
end
