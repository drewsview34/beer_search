class BeerSearchClass

    @@all = []

    attr_accessor :id

    def initialize(id)
        @id = id
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end