class API
    def self.get_response
      response = HTTParty.get('https://api.punkapi.com/v2/beers')
      response.map do |hash|
        BeerSearch.new(hash['id'])
        binding.pry
      end
    end
  end