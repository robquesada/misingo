module PetProject
  module Flyers
    module Templates
      
      require 'RMagick'
      
      class Default

      include Magick

        attr_accessor :flyer_info

        def initialize(flyer_info)
          self.flyer_info = flyer_info
        end

        def generate_flyer
          image = ImageList.new((flyer_info[:avatar].path.sub! '/original/', '/flyer/'))
          generate_header_information(image)
          generate_footer_information(image)
          image.format = 'jpeg'
          return image
        end
        
        private

        def generate_header_information(image)
          gravity = Magick::NorthGravity
          draw_text_in_image(image, 20, "SE BUSCA #{flyer_info[:pet_name].upcase}",
                             50, 'black', gravity)
          draw_text_in_image(image, 70, word_wrap("Es un #{get_breed}. #{flyer_info[:description]}", line_width: 55),
                             20, 'none', gravity)
        end

        def get_breed
          if flyer_info[:pet_breed].name == 'Otra'
            flyer_info[:pet_breed].animal_type.name
          else
            flyer_info[:pet_breed].name
          end
        end

        def generate_footer_information(image)
          gravity = Magick::SouthGravity
          draw_text_in_image(image, 100, "* SE OFRECE RECOMPENSA *",
                             25, 'none', gravity) if flyer_info[:reward] == 1
          draw_text_in_image(image, 70, "Teléfonos: #{flyer_info[:phone_numbers].join(" / ")}", 25, 'none', gravity)
          draw_text_in_image(image, 25, word_wrap("Perdido en #{flyer_info[:province].name}. #{flyer_info[:address]}", line_width: 55),
                                                  20, 'none', gravity)
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
    end
  end
end
