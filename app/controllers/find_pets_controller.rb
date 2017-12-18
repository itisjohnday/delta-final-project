class FindPetsController < ApplicationController
  def show 
    @breeds = PetFinderAPI.new.get_breeds('dog')
  end
end