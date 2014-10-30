class MainController < ApplicationController
  
  require 'RMagick'
  include Magick

  def welcome; end
  
  def home
  	if params[:province] == nil || params[:province][:province_id] == ""
		@lost_reports = LostReport.all
	else
  		@lost_reports = LostReport.where(province_id: params[:province][:province_id])
  		@province_id = params[:province][:province_id]
  	end

  	@flyer_image = generate_flyer
  end

private
	def generate_flyer
		@pet = Pet.find(9)
		img = ImageList.new((@pet.avatar.path.sub! '/original/', '/flyer/'))
		txt = Draw.new

		img.annotate(txt, 0,0,0,30, "LLAMAR A LOS TELEFONOS"){ 
			txt.gravity = Magick::SouthGravity
			txt.pointsize = 25
			txt.stroke = 'black'
	  		txt.fill = 'black'
			txt.font_weight = Magick::BoldWeight
		}

		img.annotate(txt, 0,0,0,30, ("SE BUSCA " + @pet.name.upcase)){ 
			txt.gravity = Magick::NorthGravity
			txt.pointsize = 50
			txt.stroke = 'black'
	  		txt.fill = 'black'
			txt.font_weight = Magick::BoldWeight
		}

		img.format = 'jpeg'
		send_data img.to_blob, :stream => 'false', :filename => 'flyer.jpg', :type => 'image/jpeg', :disposition => 'inline'
	end
end