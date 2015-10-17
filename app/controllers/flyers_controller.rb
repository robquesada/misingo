class FlyersController < ApplicationController
  before_action :find_lost_report, only: [:show, :preview]

  def show
    send_data flyer.to_blob, stream: 'false', filename: 'flyer.jpg',
                             type: 'image/jpeg', disposition: 'inline'
  end

  def preview
    width, height = 180, 230
    send_data flyer.resize(width, height).to_blob, type: 'image/png', disposition: 'inline'
  end

  private

  def flyer
    generator = PetProject::Flyers::Interactor.new(@lost_report)
    generator.generate_flyer
  end

  def find_lost_report
    @lost_report = LostReport.find(params[:lost_report_id])
  end
end
