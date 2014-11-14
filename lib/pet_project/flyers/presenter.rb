module PetProject
  module Flyers
    class Presenter

      def generate_info(lost_report)
        { 
          pet_name: lost_report.pet_name,
          pet_breed: lost_report.pet_breed_name, 
          pet_animal_type: lost_report.animal_type_name,
          avatar_path: (lost_report.pet_avatar.path.sub! '/original/', '/flyer/'),
          description: lost_report.description,
          reward: lost_report.reward,
          phone_numbers: lost_report.phone_numbers,
          province_name: lost_report.province.name,
          address: lost_report.address            
        }
      end

    end
  end
end
