class UserProfilesController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    # binding.pry
    @users = User.all
  end

  def show
    @pets = Pet.where(user_id: @user.id)
    if current_user && params[:id] == current_user.id.to_s
      render 'show_logged_in'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
