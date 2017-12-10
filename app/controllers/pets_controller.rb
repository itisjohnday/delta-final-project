class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index

  end

  def new
    @pet = Pet.new
  end

  def create
    # binding.pry
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    
    if @pet.save
      redirect_to pets_path, notice: 'pet was successfully created.'
    else
      render :new
    end
  end

  private
  def pet_params  
    params['pet'].permit(:name, :breed)
  end
end
