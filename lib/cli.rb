
class CLI
attr_accessor :name
@@amount =100

    def initialize
        Scrapper.new.get_coffee
        Scrapper.new.get_location_and_weather
        
    end

    def start
        system("clear")
        loading_message
        while menu != "exit"
        end
       
    end
    
    def loading_message
        puts "\e[31m" 
    puts "Please Enter your name".blue.on_red.blink
    @name=gets.chomp
    system("clear")
    puts " Namaste \u{1F64F} \u{1F64F} #{@name} how can i help you today".red
    puts " "
    end
    
    def menu
        puts "1. Check Weather \u{2600} \u{1f324} \u{1f328} "
        puts " "
        puts " "
        puts "2. Buy a cup of Coffee \u{1FAD6} \u{1F375} "
        puts " "
        puts  " "
        puts "3. Explore places to eat in Sydeny \u{1F942} \u{1F942}"
        puts " "
        puts " "
        puts "//Enter exit to exit\\"
        input= gets.strip.downcase
            if input.to_i === 1
               loop do
                    list_city_for_weather
                    puts "Press {Y} to see the city again or {X} to go back".red
                    a = gets.chomp.downcase
                    break if a == "x"
               end  
            elsif input.to_i === 2
                list_coffee  
            elsif input.to_i === 3
               
                    list_categories
               
            elsif input === "exit"
                system("clear")
                exit_program
            else
                puts "Invalid please try again !!".blue.on_red
                
            end  
    end

    def exit_program
        puts " "
        puts "Thanks for stopping by #{@name}. Until next time mate  \u{1F609} \u{1F609} !!"
        puts " "
        exit
    end
    
    def list_city_for_weather
        Weather.all.each.with_index(1) do |city, index|
            puts "#{index}.#{city.city_name}"  
        end
        puts "Please choose a city to get its description".blue
        enter=gets.chomp.to_i
        selected_city=Weather.all[enter-1]
        puts "The weather in #{selected_city.city_name} is #{selected_city.day} which is about #{selected_city.temp}".yellow 
    end

    def list_categories
        loop do 
            Restaurant_categories.reset_all
            Restaurant.reset_all
            Scrapper.new.get_restaurant
        Restaurant_categories.all.each.with_index(1) do |category, index|
            puts "#{index}.#{category.title}"  
        end
        puts "Please select a restaurant to know about it #{@name} or any other button to go back".blue
        enter=gets.chomp.to_i
        
        if enter.between?(1,8)
            
            selected_category=Restaurant_categories.all[enter-1]
            Scrapper.new.get_selected_categories (selected_category.url)
            
            Restaurant.all.each.with_index(1) do |categories, index|
                puts "#{index}.#{categories.title}".colorize(:red).on_blue
            end
            puts "Please select any Restaurant to know about it"
            enter_categories=gets.chomp.to_i
            p Restaurant.all.length
            selected_restaurant=Restaurant.all[enter_categories.to_i-1]

            Scrapper.new.get_selected_description (selected_restaurant)
            puts "Servicing Hours: #{selected_restaurant.time}".red                    
             print "Website is: #{selected_restaurant.website}"
            
            p selected_restaurant.phonenumber   
    else
        puts "Invalid Entry please select again"
    end
    puts "Enter {x} to go to Main menu or press any button too see the categories again "
    input=gets.chomp.to_s
    break if input =="x"
    end
    end
    
    def list_coffee
        loop do
            Coffee.all.each.with_index(1) do |coffee,index|
              puts "#{index}. #{coffee.name}"
            end
        puts "Enter the coffee whose description you would want to see #{@name}".blue
        enter=gets.chomp.to_i
        selected_coffee=Coffee.all[enter-1]
        puts "Price : #{selected_coffee.price}"
        puts "Description : #{selected_coffee.description}" 
        puts "Please press [y] to buy and [X] to go back !".red
        inputs= gets.chomp.to_s
        if inputs.downcase == "y"
            @@amount -= selected_coffee.price
            puts "Thanks for purchasing #{selected_coffee.name}".yellow
            puts " You now have #{@@amount} left in your account".yellow
            puts "press any button to continue"
            take=gets.chomp
            inputs = "x"
        end
        break if inputs.downcase =="x"
        end
    end
end


