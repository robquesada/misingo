module PetProject
  module Flyers
    module Templates
      require 'RMagick'

      class Default
      include Magick

        attr_accessor :flyer_info
        LIGHT_COLOR = '#84c252'
        DARK_COLOR = '#403728'

        def initialize(flyer_info)
          self.flyer_info = flyer_info
        end

        def generate_flyer
          image = ImageList.new(flyer_info[:avatar_path])
          #decorate_main_image(image)
          generate_header_information(image)
          generate_footer_information(image)
          image.format = 'jpeg'
          return image
        end

        private

        def decorate_main_image(image)
          big_circle = Draw.new
          big_circle.fill_opacity(0)
          big_circle.stroke(LIGHT_COLOR).stroke_width(14)
          big_circle.circle(306, 415, 95, 280)

          small_circle = Draw.new
          small_circle.fill_opacity(0)
          small_circle.stroke(DARK_COLOR).stroke_width(8)
          small_circle.circle(306, 415, 130, 270)

          small_circle.draw(image)
          big_circle.draw(image)
          draw_text_in_image(image, 205, word_wrap("www.misingo.com",
                                        line_width: 55), 20, 'none', Magick::SouthGravity, 'white')
        end

        def generate_header_information(image)
          gravity = Magick::NorthGravity
          draw_text_in_image(image, 20, "SE BUSCA #{flyer_info[:pet_name].upcase}",
                             50, LIGHT_COLOR, gravity, LIGHT_COLOR)
          draw_text_in_image(image, 75, word_wrap("#{pet_breed} (#{flyer_info[:pet_sex].downcase}). #{flyer_info[:description]}",
                                        line_width: 55), 20, 'none', gravity, DARK_COLOR)
        end

        def pet_breed
          if flyer_info[:pet_breed] == 'Otra'
            flyer_info[:pet_animal_type]
          else
            flyer_info[:pet_breed]
          end
        end

        def generate_footer_information(image)
          gravity = Magick::SouthGravity
          reward_text = flyer_info[:reward] == 1 ? '(RECOMPENSA)' : ''
          draw_text_in_image(image, 115, "Teléfonos: #{flyer_info[:phone_numbers].join(' / ')} #{reward_text}", 25, 'none', gravity, DARK_COLOR)
          draw_text_in_image(image, 25, word_wrap("Perdido en #{flyer_info[:province_name]}. #{flyer_info[:address]}",
                                        line_width: 55), 20, 'none', gravity, DARK_COLOR)
        end

        def word_wrap(text, options = {})
          line_width = options.fetch(:line_width, 80)
          text.split("\n").collect! do |line|
            line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip : line
          end * "\n"
        end

        def draw_text_in_image(image, move, text, text_size, stroke, gravity, color)
          draw = Draw.new
          image.annotate(draw, 0, 0, 0, move, text) do
            draw.font_family = 'Helvetica'
            draw.gravity = gravity
            draw.pointsize = text_size
            draw.stroke = stroke
            draw.fill = color
            draw.font_weight = Magick::BoldWeight
            draw.text_antialias = true
          end
        end
      end
    end
  end
end
