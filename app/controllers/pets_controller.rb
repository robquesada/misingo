class PetController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to @pet
  end
 
  private
    def pet_params
      params.require(:pet).permit(:name, :type, :description)
    end

end