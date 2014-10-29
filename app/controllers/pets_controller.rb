class PetsController < ApplicationController

  def new
    @pet = Pet.new
    @editing = false
    @breed = Breed.where(id: 1)
    (params[:is_lost] == 'true') ? (@lost = true) : (@lost = false)
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @breed = Breed.where(id: pet_params[:breed_id])
    @pet.name = pet_params[:name].capitalize

    if @pet.save
      (params[:pet][:is_lost] == "true") ? (redirect_to '/extravios/'+@pet.id.to_s+'/nuevo') : (redirect_to @pet)
    else 
      render 'new'
    end
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
      params.require(:pet).permit(:name, :animal_type_id, :breed_id, :description, :sex, :avatar, :user_id)
    end

end