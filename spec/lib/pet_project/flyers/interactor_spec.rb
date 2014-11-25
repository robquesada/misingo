require 'rails_helper'

describe PetProject::Flyers::Interactor do
  let(:lost_report) { FactoryGirl.create(:lost_report) }

  let(:flyer_info) { { pet_name: 'Pipo' } }
  let(:presenter) { double('PetProject::Flyers::Presenter', generate_info: flyer_info) }

  let(:flyer) { double('Magick::ImageList') }
  let(:template) { double('PetProject::Flyers::Templates::Default', generate_flyer: flyer) }

  let(:interactor) { PetProject::Flyers::Interactor.new(lost_report) }

  describe '#generate_flyer' do
    before do
      allow(PetProject::Flyers::Presenter).to receive(:new) { presenter }
      allow(PetProject::Flyers::Templates::Default).to receive(:new) { template }
    end

    after do
      interactor.generate_flyer
    end

    it 'creates a presenter' do
      expect(PetProject::Flyers::Presenter).to receive(:new)
    end

    it 'receive the flyer info from presenter' do
      expect(presenter).to receive(:generate_info).with(lost_report)
    end
    
    it 'creates the template' do
      expect(PetProject::Flyers::Templates::Default).to receive(:new).with(flyer_info)
    end

    it 'calls the template to generate the flyer' do
      expect(template).to receive(:generate_flyer)
    end

    it 'returns the flyer' do
      expect(interactor.generate_flyer).to eq(flyer)
    end
  end
end
