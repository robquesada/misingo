class LostReportsController < ApplicationController
	
	require 'RMagick'
  	include Magick

	def new
		@lost_report = LostReport.new
		@pet = Pet.find(params[:id])
		@editing = false
	end

	def create
		@lost_report = LostReport.new(lost_report_params)
		@pet = Pet.where(id: params[:pet_id]).first
		@lost_report.pet_id = @pet.id
		@lost_report.owner = lost_report_params[:owner].titleize

		@lost_report.save ? (redirect_to @lost_report) : (render 'new')
	end

	def edit
		@lost_report = LostReport.find(params[:id])
		@editing = true
	end

	def show
		@lost_report = LostReport.find(params[:id])
	end

	def show_flyer
  		@flyer_image = generate_flyer
	end

	def update
		@editing = true
		@lost_report = LostReport.find(params[:id])
    	@lost_report.update(lost_report_params) ? (redirect_to @lost_report) : (render 'edit')
	end

	private
      def lost_report_params
        params.require(:lost_report).permit(:owner, :phone_number1, :phone_number2, :province_id, :address, :description, :reward, :pet_id)
      end

	  def generate_flyer
		@lost_report = LostReport.find(params[:id])
		image = ImageList.new((@lost_report.pet.avatar.path.sub! '/original/', '/flyer/'))

		generate_header_information(image)
		generate_footer_information(image)

		image.format = 'jpeg'
		send_data image.to_blob, :stream => 'false', :filename => 'flyer.jpg', :type => 'image/jpeg', :disposition => 'inline'
	  end

	  def generate_header_information(image)
		draw_text_in_image(image, 20, "SE BUSCA " + @lost_report.pet.name.upcase,
					   50, 'black', Magick::NorthGravity)

		draw_text_in_image(image, 70, word_wrap("Es un " + @lost_report.pet.breed.name + ". " + @lost_report.description, line_width: 55),
					   20, 'none', Magick::NorthGravity)
	  end

	  def generate_footer_information(image)
		draw_text_in_image(image, 100, "* SE OFRECE RECOMPENSA *",
						   25, 'none', Magick::SouthGravity) if @lost_report.reward == 1
	  
		phones_text = "TELÉFONOS: " + @lost_report.phone_number1
		phones_text = phones_text + (" / " + @lost_report.phone_number2) if !@lost_report.phone_number2.nil?
		draw_text_in_image(image, 70, phones_text,
						   25, 'none', Magick::SouthGravity)

		draw_text_in_image(image, 25, word_wrap("Perdido en " + @lost_report.province.name + ". " + @lost_report.address, line_width: 55),
						   20, 'none', Magick::SouthGravity)

		end

	  def word_wrap(text, options = {})
	    line_width = options.fetch(:line_width, 80)

	    text.split("\n").collect! do |line|
	      line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip : line
	    end * "\n"
	  end
	  
	  def draw_text_in_image(image, move, text, text_size, stroke, gravity)
		txt = Draw.new
		image.annotate(txt, 0,0,0,move, text){ 
			  txt.font_family = 'arial'
			  txt.gravity = gravity
			  txt.pointsize = text_size
			  txt.stroke = stroke
	  		  txt.fill = 'black'
			  txt.font_weight = Magick::BoldWeight
			  txt.text_antialias = true
		}
	  end

end