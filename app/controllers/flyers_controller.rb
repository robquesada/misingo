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
    send_data image.to_blob, :stream => 'false', :filename => 'flyer.jpg',
                             :type => 'image/jpeg', :disposition => 'inline'
  end

  def generate_header_information(image)
    gravity = Magick::NorthGravity
    draw_text_in_image(image, 20, "SE BUSCA " + @lost_report.pet.name.upcase,
                       50, 'black', gravity)
    draw_text_in_image(image, 70, word_wrap("Es un " + get_breed + ". " +
                       @lost_report.description, line_width: 55), 20, 'none', gravity)
  end

  def get_breed
    if @lost_report.pet.breed.name == 'Otra'
      @lost_report.pet.breed.animal_type.name
    else
      @lost_report.pet.breed.name
    end
  end

  def generate_footer_information(image)
    gravity = Magick::SouthGravity
    draw_text_in_image(image, 100, "* SE OFRECE RECOMPENSA *",
                       25, 'none', gravity) if @lost_report.reward == 1
    draw_text_in_image(image, 70, get_phone_numbers, 25, 'none', gravity)
    draw_text_in_image(image, 25, word_wrap("Perdido en " + @lost_report.province.name + ". " +
                                            @lost_report.address, line_width: 55),
                                            20, 'none', gravity)
  end

  def get_phone_numbers
    if @lost_report.phone_number2.empty?
      "LLAME AL TELÉFONO: " + @lost_report.phone_number1
    else
      "TELÉFONOS: " + @lost_report.phone_number1 + " / " + @lost_report.phone_number2
    end
  end

  def word_wrap(text, options = {})
    line_width = options.fetch(:line_width, 80)

    text.split("\n").collect! do |line|
      line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip : line
    end * "\n"
  end

  def draw_text_in_image(image, move, text, text_size, stroke, gravity)
    draw = Draw.new
    image.annotate(draw, 0,0,0,move, text) do
      draw.gravity = gravity
      draw.pointsize = text_size
      draw.stroke = stroke
      draw.fill = 'black'
      draw.font_weight = Magick::BoldWeight
      draw.text_antialias = true
    end
  end
end
