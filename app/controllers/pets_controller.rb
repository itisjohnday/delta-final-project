class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pet, except: [:index, :new, :create]


  def index
    # @pets = Pet.where(user_id: current_user.id)
    @pets = Pet.all
  end

  def show
    
  end

  def new
    @pet = Pet.new
  end

  def create
    # binding.pry
    profile_pic_load = HandleImages.new(params[:pet][:file], current_user)
    object = profile_pic_load.create_object
    object = profile_pic_load.upload(object)

    upload = MediaLink.new(user_id: current_user.id, link: object.public_url, link_type: params[:pet][:file].content_type)
    pet = Pet.new(user_id: current_user.id, name: params[:pet][:name], breed: params[:pet][:breed],profile_pic: object.public_url)
    # binding.pry  
    if upload.save && pet.save
      redirect_to user_profile_path(id: current_user.id), success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      @pet = pet.new
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
