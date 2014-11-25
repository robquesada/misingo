class LostReportsController < ApplicationController
  before_filter :find_pet
  before_filter :find_lost_report, only: [:show, :edit, :update]
  before_filter :validate_owner, only: [:edit, :update]

  def new
    @lost_report = @pet.build_lost_report
  end

  def create
    @lost_report = @pet.build_lost_report(lost_report_params)
    if @lost_report.save
      redirect_to pet_lost_report_path(@pet)
    else
      flash.now[:error] = @lost_report.errors.messages
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @lost_report.update(lost_report_params)
      redirect_to pet_lost_report_path(@pet)
    else
      flash.now[:error] = @lost_report.errors.messages
      render 'edit'
    end
  end

  private

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def find_lost_report
    @lost_report = @pet.lost_report
  end

  def validate_owner
    redirect_to home_path unless current_user == @pet.user
  end

  def lost_report_params
    params.require(:lost_report).permit(
      :owner,
      :province_id,
      :address,
      :description,
      :reward,
      phone_numbers: []
    )
  end
end
