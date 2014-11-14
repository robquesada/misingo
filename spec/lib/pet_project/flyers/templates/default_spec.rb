require 'rails_helper'

describe PetProject::Flyers::Templates::Default do

  let(:image_path) { "pet/cat.jpg" }
  let(:flyer) { double("Magick::ImageList", { 'format=' => 'jpeg', 'annotate' => 'jpeg' }) }

  let(:flyer_info) { { 
                       pet_name: "Pipo",
                       pet_breed: "Zaguate", 
                       avatar_path: image_path,
                       description: "Tiene una mancha en la oreja",
                       reward: 1,
                       phone_numbers: ["12345678", "87654321"],
                       province_name: "Alajuela",
                       address: "Cerca del McDonald's del centro"
                   } }

  let(:default_template) { PetProject::Flyers::Templates::Default.new(flyer_info) }

  describe "#generate_flyer" do

    before do
      allow(Magick::ImageList).to receive(:new) { flyer }
    end

    after do
      default_template.generate_flyer
    end

    it "creates a new image" do
      expect(Magick::ImageList).to receive(:new).with(image_path)
    end

    it "sets image format" do
      expect(flyer).to receive(:format=).with(String)
    end

    it "returns the image" do
      expect(default_template.generate_flyer).to eq(flyer)
    end
  end

end
