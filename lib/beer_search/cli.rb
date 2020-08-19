class CLI
    
    def run
        welcome
        search_menu
        search_for_another_beer
    end

    def welcome
        puts "******* Welcome to Beer Search *******"
        puts "******* Are you 21 Years of Age *******"
        puts "******* Please enter y/n *******"
        input = gets.chomp
        if input == "y"
            puts "Great! Lets Search for Some Beers"
            search_menu
        else
            puts "Sorry! You're Not Old Enough."
            return
        end
    end

    def search_menu
        # while input != "exit"
        puts "******* Please Select A Beer From The Following Options *******"
        display_beers
        puts "******* Please Enter A Number For Your Selection *******"
        beer_selection = gets.chomp
        pick_a_beer(beer_selection)


        # puts "******* Please Select A Detail From The Following Options *******"
        # display_beer_details(input)
        # input
        # puts "******* type 1 for all beers / 2 for taglines / 3 for description/ 4 for abv OR Exit to End the Search *******"

        # if input == "1"
        #     display_beers
        # elsif input == "2"
        #     API.get_response
        #     BeerSearchClass.all.each.with_index(1) do |obj, index|
        #         puts "#{index}: #{obj.tagline}"
        #     end
        # elsif input = "3"
        #     display_beers
        # else 
        #    puts "exit"
        # end
    end

    # def input
    #     input = gets.chomp 
    # end

    def display_beers
        API.get_response
        BeerSearchClass.all.each.with_index(1) do |obj, index|
            puts "#{index}: #{obj.name}"
        end
    end

    def pick_a_beer(beer_selection)

        # API.get_response
        puts "******* You Chose #{BeerSearchClass.find(beer_selection).name}. Here Are The Detials. *******"
        puts "* #{BeerSearchClass.find(beer_selection).abv}"
        puts "* #{BeerSearchClass.find(beer_selection).tagline}"
        puts "* #{BeerSearchClass.find(beer_selection).description}"

        # beers = display_beers
        # beers.each_with_index(input) do |beer, index|
        #     if input == index - 1
        #         puts "Is this your #{beer}?"
        #     end
        # end
    end

    def search_for_another_beer
        puts "******* Would You Like To Search For Another Beer? Please Enter 'y' To Search. Or 'n' To Exit *******"
        search_again = gets.chomp
        if search_again == "y"
            BeerSearchClass.all.each.with_index(1) do |obj, index|
                puts "#{index}: #{obj.name}"
            end
        else
            return
        end
    end
end