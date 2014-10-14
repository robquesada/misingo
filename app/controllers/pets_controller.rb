class PetsController < ApplicationController

  def new
    @pet = Pet.new
    @editing = false
  end
  
  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to @pet
    else
      render 'new'
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @breed = Breed.where(id: 2)
    p "SHOW"
    p @breed.name
  end

  def index
    @pets = Pet.all
  end

  def edit
    @pet = Pet.find(params[:id])
    @editing = true
  end

  def update
    @pet = Pet.find(params[:id])
 
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
 
    redirect_to pets_path
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :id_animal_type, :id_breed, :description, :sex, :avatar)
    end

end