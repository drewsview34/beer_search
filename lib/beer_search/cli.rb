class CLI
    
    def run
        welcome
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
        end
    end

    def search_menu
        # while input != "exit"
        puts "******* Please Enter How You Would Like to Search... *******"
        puts "******* type 1 for all beers / 2 for taglines / 3 for description/ 5 for abv OR Exit to End the Search *******"
        input = gets.chomp
        if input == "1"
            display_beers
        elsif input == "2"
            API.get_response
            BeerSearchClass.all.each.with_index(1) do |obj, index|
                puts "#{index}: #{obj.tagline}"
            end
        elsif input = "3"
            display_beers
        else 
           puts "exit"
        end
    end


    def display_beers
        API.get_response
        BeerSearchClass.all.each.with_index(1) do |obj, index|
            puts "#{index}: #{obj.name}"
        end

    end

end