class AdoptionsController < ApplicationController
  before_filter :find_adoption, only: [:show, :edit, :update]
  before_filter :validate_owner, only: [:edit, :update]
  before_filter :find_all_adoptions, only: [:index]
  before_filter :filter_adoptions, only: [:index]
  before_action :authenticate_user!, only: [:new, :edit]

  def index; end

  def new
    @adoption = Adoption.new
    @adoption.build_pet
  end

  def create
    @adoption = current_user.adoptions.new(adoption_params)
    if @adoption.save
      redirect_to adoption_path(@adoption)
    else
      flash.now[:error] = @adoption.errors.messages
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @adoption.update(adoption_params)
      redirect_to adoption_path(@adoption)
    else
      flash.now[:error] = @adoption.errors.messages
      render 'edit'
    end
  end

  private

  def find_all_adoptions
    @pet_reports = Adoption.all
  end

  def filter_adoptions
    if params[:province].nil? || params[:province][:province_id].empty?
      find_all_adoptions
    else
      @pet_reports = find_all_adoptions.where(province_id: params[:province][:province_id])
      @province_id = params[:province][:province_id]
    end
  end

  def find_adoption
    @adoption = Adoption.find(params[:id])
  end

  def validate_owner
    redirect_to root_path unless current_user == @adoption.user
  end

  def adoption_params
    params.require(:adoption).permit(
      :province_id,
      :description,
      :contact,
      phone_numbers: [],
      pet_attributes: [:id, :name, :breed_id, :sex, :avatar,
                       :castrated, :age, :size]
    )
  end
end
