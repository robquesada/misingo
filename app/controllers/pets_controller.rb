class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end
  
  def create
    @pet = Pet.new(pet_params)
 
    p "HERE"
    p @pet
    @pet.save
    p @pet.save
    redirect_to @pet
  end
 
  private
    def pet_params
      params.require(:pet).permit(:name, :kind, :description)
    end

  def show
    p "show"
    p @pet
    p params[:id]
    @pet = Pet.find(params[:id])
  end

end