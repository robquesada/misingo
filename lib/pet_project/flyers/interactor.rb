module PetProject
  module Flyers
    class Interactor

      attr_accessor :pet, :lost_report

      def initialize(pet, lost_report)
        self.pet = pet
        self.lost_report = lost_report
      end

      def generate_flyer
        presenter = PetProject::Flyers::Presenter.new
        flyer_info = presenter.generate_info(pet, lost_report)
        template = PetProject::Flyers::Templates::Default.new(flyer_info)
        template.generate_flyer
      end

    end
  end
end
