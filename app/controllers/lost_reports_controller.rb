class LostReportsController < ApplicationController
  
  before_filter :find_pet
  before_filter :find_lost_report, only: [:show, :edit, :update]

  def new
    @lost_report = @pet.build_lost_report
  end

  def create
    @lost_report = @pet.build_lost_report(lost_report_params)
    if @lost_report.save
      redirect_to pet_lost_report_path(@pet)
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @lost_report.update(lost_report_params)
      redirect_to pet_lost_report_path(@pet)
    else
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

  def lost_report_params
    params.require(:lost_report).permit(
      :owner,
      :phone_number1,
      :phone_number2,
      :province_id,
      :address,
      :description,
      :reward
    )
  end
end