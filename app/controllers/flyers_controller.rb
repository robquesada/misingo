require 'pet_project/flyers/generator'

class FlyersController < ApplicationController

  def show
    @pet = Pet.find(params[:pet_id])
    @lost_report = @pet.lost_report
    send_data flyer.to_blob, :stream => 'false', :filename => 'flyer.jpg',
                             :type => 'image/jpeg', :disposition => 'inline'
  end

  private

  def flyer
    generator = PetProject::Flyers::Generator.new(@pet, @lost_report)
    generator.generate_flyer
  end
end
