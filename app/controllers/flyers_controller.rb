class FlyersController < ApplicationController
  before_action :set_instance_variables, only: [:show, :preview]

  def show
    send_data flyer.to_blob, stream: 'false', filename: 'flyer.jpg',
                             type: 'image/jpeg', disposition: 'inline'
  end

  def preview
    width, height = 300, 400
    send_data flyer.resize(width, height).to_blob, type: 'image/png', disposition: 'inline'
  end

  private

  def flyer
    generator = PetProject::Flyers::Interactor.new(@lost_report)
    generator.generate_flyer
  end

  def set_instance_variables
    @pet = Pet.find(params[:pet_id])
    @lost_report = @pet.lost_report
  end
end
