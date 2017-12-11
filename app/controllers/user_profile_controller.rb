class UserProfileController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def user_pets
    @pets = Pet.where(user_id: current_user.id)
  end

  def user_info
    @user = User.find(current_user.id)
  end

end
