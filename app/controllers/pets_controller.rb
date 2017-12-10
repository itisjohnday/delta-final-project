class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_pet, except: [:index, :new, :create]


  def index
    @pets = Pet.all
  end

  def show

  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    
    if @pet.save
      redirect_to pets_path, notice: 'pet was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pets_path, notice: 'pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'pet was successfully removed.'
  end

  private
  def pet_params  
    params['pet'].permit(:name, :breed)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
