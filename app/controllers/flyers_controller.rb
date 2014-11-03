require 'RMagick'

class FlyersController < ApplicationController
  include Magick

  def show
    @pet = Pet.find(params[:pet_id])
    @lost_report = @pet.lost_report
    @flyer_image = generate_flyer
  end

  private

  def generate_flyer
    image = ImageList.new((@pet.avatar.path.sub! '/original/', '/flyer/'))

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
    image.annotate(txt, 0,0,0,move, text) do
      txt.gravity = gravity
      txt.pointsize = text_size
      txt.stroke = stroke
      txt.fill = 'black'
      txt.font_weight = Magick::BoldWeight
      txt.text_antialias = true
    end
  end
end
