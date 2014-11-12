require 'pet_project/flyers/generator'

class FlyersController < ApplicationController

  def show
    @pet = Pet.find(params[:pet_id])
    @lost_report = @pet.lost_report
    generate_flyer
  end

  private

  def generate_flyer
    generator = PetProject::Flyers::Generator.new(@pet, @lost_report)
    image = generator.generate_flyer
    send_data image.to_blob, :stream => 'false', :filename => 'flyer.jpg',
                             :type => 'image/jpeg', :disposition => 'inline'
  end

end
