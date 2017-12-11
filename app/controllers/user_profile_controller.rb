class UserProfileController < ApplicationController
  before_action :find_user, only: [:show]

  def index
      @user = User.find(1)
  end

  def find_user
    @user = User.find(params[:id])
  end



end
