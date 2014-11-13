module PetProject
  module Flyers
    class Presenter

      def generate_info(pet, lost_report)
        flyer_info = { pet_name: pet.name,
                       pet_breed: pet.breed.name, 
                       pet_animal_type: pet.breed.animal_type.name,
                       avatar_path: (pet.avatar.path.sub! '/original/', '/flyer/'),
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
