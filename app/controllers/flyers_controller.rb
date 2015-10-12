class FlyersController < ApplicationController
  def show
    @lost_report = LostReport.find(params[:lost_report_id])
    send_data flyer.to_blob, stream: 'false', filename: 'flyer.jpg',
                             type: 'image/jpeg', disposition: 'inline'
  end

  private

  def flyer
    generator = PetProject::Flyers::Interactor.new(@lost_report)
    generator.generate_flyer
  end
end
