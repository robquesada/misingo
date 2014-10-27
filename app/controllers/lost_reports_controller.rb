class LostReportsController < ApplicationController
	def new
		@lost_report = LostReport.new
		@pet = Pet.find(params[:id])
	end

	def create
		@lost_report = LostReport.new(lost_report_params)
		@lost_report.pet_id = params[:pet_id]
		@lost_report.save ? (redirect_to @lost_report) : (render 'new')
	end

	def show
		@lost_report = LostReport.find(params[:id])
	end

	private
      def lost_report_params
        params.require(:lost_report).permit(:owner, :phone_number1, :phone_number2, :province_id, :address, :description, :reward, :pet_id)
      end
end