class PetFinderAPI
  def initialize
    @connection = self.create_connection
  end

  def create_connection
    conn = Faraday.new(:url => 'http://api.petfinder.com/') do |faraday|
        faraday.request  :url_encoded
        faraday.response :json       
        faraday.adapter  Faraday.default_adapter 
      end
  end

  def get_breeds(animal_type)
    response = @connection.get "/breed.list?key=6a644738df6b4fd6db637b75c7caa9a3&animal=#{animal_type}&format=json"
    breeds = []
    response.body["petfinder"]["breeds"]["breed"].each do |value|
      breeds << value["$t"]
    end
    return breeds
  end

  def shelter_list_by_breed(animal_type, breed)
    response = @connection.get "/shelter.listByBreed?key=6a644738df6b4fd6db637b75c7caa9a3&animal=#{animal_type}&breed=#{breed}format=json"
    shelters_with_breed = []
    response.body["petfinder"]["breeds"]["breed"].each do |value|
      shelters_with_breed << value["$t"]
    end
    return shelters_with_breed
  end

#   shelter.listByBreed
# Returns a list of shelter IDs listing animals of a particular breed.

# ARGUMENTS
# animal  string  required  type of animal (barnyard, bird, cat, dog, horse, reptile, smallfurry)
# breed string  required  breed of animal(use breed.list for a list of valid breeds)
# offset  integer optional  offset into the result set (default is 0)
# count integer optional  how many records to return for this particular API call (default is 25)
# format  string  optional (default=xml)  Response format: xml, json
end
