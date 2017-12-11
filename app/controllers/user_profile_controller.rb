class UserProfileController < ApplicationController
  before_action :find_user, only: [:show]
  before_action :find_pets, only: [:index]

  def index
    @user = User.find(current_user.id)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_pets
    @pets = Pet.where(user_id: 1)
  end

  def user_info
    @user = User.find(1)
  end

  def find_pets
    @pets = Pet.where(username: 'philton')
  end

end
