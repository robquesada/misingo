class PetController < ApplicationController

  def new
    @pet = Pet.new
  end

end
