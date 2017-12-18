class FindBreeds
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
end