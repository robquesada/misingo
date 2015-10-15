require 'rails_helper'

describe PetProject::Flyers::Presenter do
  let(:lost_report) { FactoryGirl.create(:lost_report) }
  let(:presenter) { PetProject::Flyers::Presenter.new }

  describe '#generate_info' do
    it 'receives a lost report' do
      expect(presenter).to receive(:generate_info).with(lost_report)
      presenter.generate_info(lost_report)
    end

    it 'returns a hash with the flyer information' do
      expect(presenter.generate_info(lost_report)).to eq(
        {
          pet_name: lost_report.pet_name,
          pet_breed: lost_report.pet_breed_name, 
          pet_animal_type: lost_report.animal_type_name,
          pet_sex: lost_report.pet.sex,
          avatar_path: lost_report.pet_avatar.url(:flyer),
          description: lost_report.description,
          reward: lost_report.reward,
          phone_numbers: lost_report.phone_numbers,
          province_name: lost_report.province.name,
          address: lost_report.address            
        }
      )
    end
  end
end
