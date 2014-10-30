class MainController < ApplicationController

  def welcome; end
  
  def home
  	if params[:province] == nil || params[:province][:province_id] == ""
		@lost_reports = LostReport.all
	else
  		@lost_reports = LostReport.where(province_id: params[:province][:province_id])
  		@province_id = params[:province][:province_id]
  	end
  end
end