class AboutController < ApplicationController
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

  def vote_reg
  end

  def pics
    

  end
end