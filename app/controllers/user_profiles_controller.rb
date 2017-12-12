class UserProfilesController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    @pets = Pet.where(user_id: @user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
