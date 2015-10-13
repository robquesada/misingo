class LostReportsController < ApplicationController
  before_filter :find_lost_report, only: [:show, :edit, :update]
  before_filter :validate_owner, only: [:edit, :update]

  def new
    @lost_report = LostReport.new
    @lost_report.build_pet
  end

  def create
    @lost_report = current_user.lost_reports.new(lost_report_params)
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
    if @lost_report.update(lost_report_params)
      redirect_to lost_report_path(@lost_report)
    else
      flash.now[:error] = @lost_report.errors.messages
      render 'edit'
    end
  end

  private

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
      phone_numbers: [],
      pet_attributes: [:name, :breed_id, :sex, :avatar]
    )
  end
end
