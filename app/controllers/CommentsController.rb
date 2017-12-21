class CommmentsController < ApplicationController

  def create
    puts "Comment here"
    @link = MediaLink.find(params[:media_link_id])

    if @comment.save
      Comment.create(username: current_user, description: "Somestuff" media_link_id: link.id)
    end
    redirect_to user_profile_media_links_path(@link), success: 'comment successfully added'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def destroy
  end


end
