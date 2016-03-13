class LostReportsController < ApplicationController
  before_filter :find_lost_report, only: [:show, :edit, :update]
  before_filter :validate_owner, only: [:edit, :update]
  before_filter :find_all_lost_reports, only: [:index]
  before_filter :filter_lost_reports, only: [:index]
  before_action :authenticate_user!, only: [:new, :edit]

  def index; end

  def new
    @lost_report = LostReport.new
    @lost_report.build_pet
  end

  def create
    @lost_report = current_user.lost_reports.new(lost_report_params)
    @lost_report.owner = current_user.name
    if @lost_report.save
      redirect_to lost_report_path(@lost_report)
    else
      flash.now[:error] = @lost_report.errors.messages
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    respond_to do |format|
      if @lost_report.update(lost_report_params)
        format.html { redirect_to lost_report_path(@lost_report) }
        format.js { render :update }
      else
        format.html do
          flash.now[:error] = @lost_report.errors.messages
          render 'edit'
        end
      end
    end
  end

  private

  def find_all_lost_reports
    @pet_reports = LostReport.all.page params[:page]
  end

  def filter_lost_reports
    if params[:province].nil? || params[:province][:province_id].empty?
      find_all_lost_reports
    else
      @pet_reports = find_all_lost_reports.where(province_id: params[:province][:province_id]).page params[:page]
      @province_id = params[:province][:province_id]
    end
  end

  def find_lost_report
    @lost_report = LostReport.find(params[:id])
  end

  def validate_owner
    redirect_to root_path unless current_user == @lost_report.user
  end

  def lost_report_params
    params.require(:lost_report).permit(
      :province_id,
      :address,
      :description,
      :reward,
      :found,
      phone_numbers: [],
      pet_attributes: [:id, :name, :breed_id, :sex, :avatar]
    )
  end
end
