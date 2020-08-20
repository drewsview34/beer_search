class BeerSearchClass

    @@all = []

    attr_accessor :name, :tagline, :description, :abv

    def initialize(name, tagline, description, abv)
        @name = name
        @tagline = tagline
        @description = description
        @abv = abv
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.find_by_input(input)
        @@all[input.to_i - 1]
    end
end