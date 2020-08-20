class CLI

    attr_accessor :saved_beers
    
    def run
        API.get_response
        
        welcome

        welcome_input = input
        if welcome_input == "y"
            puts "Great! Lets Search for Some Beers"
            search_menu
        else
            puts "Sorry! You're Not Old Enough."
            return
        end

        beer_selection = input
        pick_a_beer(beer_selection)

        search_for_another_beer
    end

    def welcome
        puts "******* Welcome to Beer Search *******"
        puts "******* Are you 21 Years of Age *******"
        puts "******* Please enter y/n *******"
    end

    def search_menu
        puts "******* Please Select A Beer From The Following Options *******"
        @saved_beers = display_beers
        puts "******* Please Enter A Number For Your Selection *******"
    end

    def input
        input = gets.chomp 
    end

    def display_beers
        BeerSearchClass.all.each.with_index(1) do |obj, index|
            puts "#{index}: #{obj.name}"
        end
    end

    def pick_a_beer(beer_selection)
        if beer_selection.to_i <= 0 && beer_selection.to_i >= BeerSearchClass.all.length
            puts "Invalid response. Please Choose a Number From 1 - 25."
        else
            details = BeerSearchClass.find_by_input(beer_selection)
        puts "******* You Chose #{details.name}. Here Are The Detials. *******"
        puts details.abv
        puts details.tagline
        puts details.description
        end
    end

    def search_for_another_beer
        puts "******* Would You Like To Search For Another Beer? Please Enter 'y' To Search. Or 'n' To Exit *******"
        search_again = gets.chomp
        if search_again == "y"

            puts "Great! Lets Search for Some Beers"
            search_menu

            beer_selection = gets.chomp
            pick_a_beer(beer_selection)
    
            search_for_another_beer
        end
    end
end 