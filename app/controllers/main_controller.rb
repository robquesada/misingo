class MainController < ApplicationController
  def welcome; end

  def home
    if params[:province].nil? || params[:province][:province_id].empty?
      @lost_reports = LostReport.all.page params[:page]
    else
      @lost_reports = LostReport.where(province_id: params[:province][:province_id]).page params[:page]
      @province_id = params[:province][:province_id]
    end

    @invite = Invite.new
  end
end
