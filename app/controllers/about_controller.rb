class AboutController < ApplicationController
  before_action
  def index
  end

  def show 
  end

  def search
    @pets = Pet.where(name: params['search'])
    @users = User.where(username: params['search'])
  end

  def prelim
    @media = MediaLink.first(10)

  end
end