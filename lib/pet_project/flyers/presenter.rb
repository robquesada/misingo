module PetProject
  module Flyers
    class Presenter

      attr_accessor :pet, :lost_report

      def initialize(pet, lost_report)
        self.pet = pet
        self.lost_report = lost_report
      end

      def generate_flyer
        interactor = PetProject::Flyers::Interactor.new
        flyers_info = interactor.generate_info(pet, lost_report)
        template = PetProject::Flyers::Templates::Default.new(flyers_info)
        template.generate_flyer
      end

    end
  end
end
