class LostReportsController < ApplicationController
  before_filter :find_pet

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

  def edit
    @lost_report = @pet.lost_report
  end

  def show
    @lost_report = @pet.lost_report
  end

  def update
    @lost_report = @pet.lost_report
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
