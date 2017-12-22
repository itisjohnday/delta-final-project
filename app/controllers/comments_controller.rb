class CommentsController < ApplicationController


  def create
    @link = MediaLink.find(params[:media_link_id])
    @comment = Comment.create(username: current_user, :description, :media_link_id)
    if @comment.save
      redirect_to user_profile_media_links_path(:user_id @user.id), success: 'comment successfully added'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def destroy
  end




end
