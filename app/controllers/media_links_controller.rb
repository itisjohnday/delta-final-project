class MediaLinksController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :set_user

  def index
    @links = MediaLink.where(user_id: @user.id)
  end

  def show

  end

  def new
    @pet = MediaLink.new
  end

  def create
    @pet = MediaLink.new(pet_params)
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

  def set_user
    @user = User.find(params[:user_id])
  end
end
