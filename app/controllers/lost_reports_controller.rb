class LostReportsController < ApplicationController
	def new
		@lost_report = LostReport.new
	end

	def create
		@lost_report = LostReport.new(lost_report_params)
		@lost_report.save ? (redirect_to @lost_report) : (render 'new')
	end

	private
      def lost_report_params
        params.require(:lost_report).permit(:owner, :phone_number1, :phone_number2, :province, :address, :description, :reward)
      end
end