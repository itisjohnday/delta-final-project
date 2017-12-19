class FindPetsController < ApplicationController
  def index
    @breeds = PetFinderAPI.new.get_breeds('dog')
  end

  def show 
  end
end