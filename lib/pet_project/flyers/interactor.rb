module PetProject
  module Flyers
    class Interactor

      def generate_info(pet, lost_report)
        flyer_info = { pet_name: pet.name,
                       pet_breed: pet.breed, 
                       avatar: pet.avatar,
                       description: lost_report.description,
                       reward: lost_report.reward,
                       phone_numbers: lost_report.phone_numbers,
                       province: lost_report.province,
                       address: lost_report.address
                     }
      end

    end
  end
end
