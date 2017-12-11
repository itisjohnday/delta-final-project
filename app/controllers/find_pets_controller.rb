class FindPetsController < ApplicationController
  def show 
    @breeds = FindBreeds.new.get_breeds('dog')
  end
end