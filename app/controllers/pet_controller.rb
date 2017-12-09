class PetController < ApplicationController

  def index
    @pets = Pet.all
  end

  def create

  end
end
