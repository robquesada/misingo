class PetsController < ApplicationController

  def new
    @pet = Pet.new
    @editing = false
    @breed = Breed.where(id: 1)
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save ? (redirect_to @pet) : (render 'new')
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def index
    @pets = Pet.where(user_id: current_user.id)
  end

  def edit
    @pet = Pet.find(params[:id])
    @editing = true
    @breed = Breed.where(id: @pet.breed_id)
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params) ? (redirect_to @pet) : (render 'edit')
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  def breed_change
    @breed = Breed.where(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :animal_type_id, :breed_id, :description, :sex, :avatar, :id_user)
    end

end