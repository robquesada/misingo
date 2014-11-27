class PetsController < ApplicationController
  before_filter :find_pet, only: [:show, :edit, :update, :destroy]
  before_filter :find_breeds, only: [:new, :edit, :update, :create]
  before_filter :validate_owner, only: [:edit, :update]

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to new_pet_lost_report_path(@pet)
    else
      flash.now[:error] = @pet.errors.messages
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @pet.update(pet_params)
      redirect_to @pet
    else
      flash.now[:error] = @pet.errors.messages
      render 'edit'
    end
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

  def validate_owner
    redirect_to home_path unless current_user == @pet.user
  end

  def pet_params
    params.require(:pet).permit(:name, :breed_id, :sex, :avatar)
  end
end
