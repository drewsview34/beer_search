class BeerSearchClass

    @@all = []

    attr_accessor :id, :name, :tagline, :description, :abv

    def initialize(id, name, tagline, description, abv)
        @id = id
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
    
    def self.find(input)
        @@all[input.to_i - 1]
    end
end