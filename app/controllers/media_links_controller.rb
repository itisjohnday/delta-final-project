class MediaLinksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user
  before_action :set_comments, only: [:show]

  def index
    @links = MediaLink.all
  end

  def show
    @links = MediaLink.where(user_id: @user.id)
  end

  def new
    @media_link = MediaLink.new
  end

  def create

    if params['pets'] == nil
      return redirect_to user_profile_path(id: current_user.id), alert: 'a pet must be tagged before uploading'
    end
    # Make an object in your bucket for your upload
    filename = current_user.username + rand(100000000..999999999).to_s + params[:file].original_filename
    # Upload the file
    obj = DELTA_BUCKET.object(filename)
    obj.upload_file(params[:file].to_io, options = {acl: 'public-read'})
    # Create an object for the upload
    upload = MediaLink.new(user_id: current_user.id, link: obj.public_url, link_type: params[:file].content_type)
    # Save the upload
    if upload.save
      params['pets'].each do |pet|
        PetsMediaLink.create(pet_id: pet.to_i, media_link_id: upload.id)
      end
      redirect_to user_profile_media_links_path(user_profile_id: 1), success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def edit
  end


  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'pet was successfully removed.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_comments
    # @comments = Comment.where(media_link_id: @user.id)
  end
end
