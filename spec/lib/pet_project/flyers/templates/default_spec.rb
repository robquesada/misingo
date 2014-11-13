require 'rails_helper'

describe PetProject::Flyers::Templates::Default do

  let(:breed) { FactoryGirl.create(:breed) }
  let(:pet) { FactoryGirl.create(:pet, breed: breed) }
  let(:province) { FactoryGirl.create(:province) }
  let(:lost_report) { FactoryGirl.create(:lost_report, pet: pet, province: province) }

  let(:image_path) { String }
  let(:flyer) { double("Magick::ImageList", { 'format=' => 'jpeg', 'annotate' => 'jpeg' }) }

  let(:flyer_info) { { pet_name: pet.name,
                       pet_breed: pet.breed, 
                       avatar: pet.avatar,
                       description: lost_report.description,
                       reward: lost_report.reward,
                       phone_numbers: lost_report.phone_numbers,
                       province: lost_report.province,
                       address: lost_report.address
                   } }

  let(:default_template) { PetProject::Flyers::Templates::Default.new(flyer_info) }

  describe "generating flyer" do

    before do
      allow(Magick::ImageList).to receive(:new) { flyer }
    end

    after do
      default_template.generate_flyer
    end

    it "creates a new image" do
      expect(Magick::ImageList).to receive(:new).with(image_path)
    end

    it "generates header information" do
      expect(default_template).to receive(:generate_header_information).with(flyer)
    end

    it "generates footer information" do
      expect(default_template).to receive(:generate_footer_information).with(flyer)
    end

    it "sets image format" do
      expect(flyer).to receive(:format=).with(String)
    end
  end

end
