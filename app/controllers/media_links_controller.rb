class MediaLinksController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :set_user

  def index
    @links = MediaLink.where(user_id: @user.id)
  end

  def show

  end

  def new
    @media_link = MediaLink.new
  end

  def create
    # binding.pry
    # Make an object in your bucket for your upload
    # obj = .objects[params[:file].original_filename] 

    # Upload the file
    test = DELTA_BUCKET.object(params[:file].original_filename).upload_file(params[:file].to_io)
    binding.pry
    # Create an object for the upload
      # @upload = MediaLink.new(
      #     url: obj.public_url,
      # name: obj.key
      # #   )

    # Save the upload
    # if @upload.save
    #   redirect_to uploads_path, success: 'File successfully uploaded'
    # else
    #   flash.now[:notice] = 'There was an error'
    #   render :new
    # end
    render :show
  end

  def edit
  end


  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'pet was successfully removed.'
  end

  private
  # def pet_params  
  #   params['pet'].permit(:name, :breed)
  # end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end
end
