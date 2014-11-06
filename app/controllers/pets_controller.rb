class PetsController < ApplicationController

  before_filter :find_pet, only: [:show, :edit, :update, :destroy]
  before_filter :find_breeds, only: [:new, :edit]

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to new_pet_lost_report_path(@pet)
    else
      render 'new'
    end
  end

  def show; end

  def index
    @pets = Pet.where(user_id: current_user.id)
  end

  def edit; end

  def update
    @pet.update(pet_params) ? (redirect_to @pet) : (render 'edit')
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def find_breeds
    @breeds = Breed.order(:name)
  end

  def pet_params
    params.require(:pet).permit(:name, :breed_id, :description, :sex, :avatar)
  end
end
