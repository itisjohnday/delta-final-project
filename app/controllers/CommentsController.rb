class CommmentsController < ApplicationController
before_action :find_comment, only: [:create, :destroy]
before_action :comment_auth, only: [:destroy]

  def create
    @link = MediaLink.find(params[:media_link_id])
    @comment = current_user.comments.build(comment_params)
    @comment.save # returns true if save successful, false otherwise
    redirect_to user_profile_media_link_path(@link)
  end

  def destroy
    @comment = @link.comments.find(params[:id]).destroy
    redirect_to user_profile_media_link_path(@link)
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :description, :media_link_id)
  end

  def find_comment
    @link = MediaLink.find(params[:media_link_id])
  end

  def comment_auth
    if current_user != @link.user
      redirect_to(root_path)
    end
  end

end
