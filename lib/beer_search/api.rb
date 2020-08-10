class API
    def self.get_response
      response = HTTParty.get('https://api.punkapi.com/v2/beers')
      response.each do |hash|
        BeerSearchClass.new(hash['id'],hash['name'],hash['tagline'],hash['description'],hash['abv'])
      end
    end
  end