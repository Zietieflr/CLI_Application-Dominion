class Cli 
  
   def prompt
      TTY::Prompt.new
   end
  
  def welcome
    puts 'Welcome to Dominion Helper!'
  end

  def get_user_input
    user_input = gets.chomp
  end

  def user_name 
    new_user = prompt.yes?("Are you a new user? (Y/n)")
    

    if new_user
      puts "Create Your New User Name: "

      user_name_input = get_user_input

      user = User.find_by(user_name: user_name_input)

      if user
        while user
        puts "Sorry, this name has been taken."
        puts "Try another name: "
        user_name_input = get_user_input
        user = User.find_by(user_name: user_name_input)
        end
        puts "Welcome #{user_name_input}, We're here to help you conquer your Dominion!"
      else
        User.create(user_name: user_name_input)
        puts "Welcome #{user_name_input}, We're here to help you conquer your Dominion!"
      end
    else
      puts "Enter your user name: "
      user_name_input = get_user_input
      puts "Welcome back #{user_name_input}, We're here to help you conquer your Dominion!"
      
    end
  end

  def menu_prompt(choices)
    prompt.select("Choose Option:", choices, cycle: true)
  end
    


  def main_menu 
    main_menu_choices = {
      'Quick Start/Setup' => 1, 
      'Browse Cards' => 2 ,
      'Create Set' => 3, 
      'My Sets' => 4, 
      'My Expansions' => 5, 
      'Exit' => 6}
    answer = menu_prompt(main_menu_choices)

    case answer 
      when 1
        quick_menu = QuickStart.new
        quick_menu.quick_start_welcome
        quick_menu.quick_start
        
      when 2
        browse_menu
      when 3
        create_set
      when 4
        my_sets
      when 5
        my_expansions
      when 6
        exit_message
    end 
  end

  def browse_menu
    browse_choices = {
        "Browse Base Game / Expansions" => 1,
        "Browse All" => 2,
        "Search By Name" => 3,
        "Main Menu" => 4
    }
    browse_answer = menu_prompt(browse_choices)

      case browse_answer
        when 1
          expansion_menu
        when 2
          browse_all 
          browse_menu
        when 3
          puts "Enter Card Name: "
          search_by_name(get_user_input)
          browse_menu
        when 4
          main_menu
      end
  end

  def expansion_menu

    expansion_menu_choices = {
      "Intrigue" => 1,
      "Seaside" => 2,
      "Prosperity" => 3,
      "Hinterlands" => 4,
      "Alchemy" => 5,
      "Guilds" => 6,
      "Cornucopia" => 7,
      "Dark Ages" => 8,
      "Promo" => 9,
      "Dominion" => 10,
      "Base Cards" => 11,
      "Adventures" => 12,
      "Empires" => 13,
      "Nocturne" => 14,
      "Renaissance" => 15,
      "Back To Browse Menu" => 16 
    }

    expansion_choice = menu_prompt(expansion_menu_choices)

    case expansion_choice
      when 1
        browse_by_expansion "Intrigue" 

        expansion_menu
      when 2
        browse_by_expansion "Seaside"
        expansion_menu
      when 3
        browse_by_expansion "Prosperity"
        expansion_menu
      when 4
        browse_by_expansion "Hinterlands"
        expansion_menu
      when 5
        browse_by_expansion "Alchemy"
        expansion_menu
      when 6
        browse_by_expansion "Guilds"
        expansion_menu
      when 7
        browse_by_expansion "Cornucopia"
        expansion_menu
      when 8
        browse_by_expansion "Dark Ages"
        expansion_menu
      when 9
        browse_by_expansion "Promo" 
        expansion_menu
      when 10
        browse_by_expansion "Dominion"
      when 11
        browse_by_expansion "Base Cards"
      when 12
        browse_by_expansion "Adventures"
      when 13
        browse_by_expansion "Empires"
      when 14
        browse_by_expansion "Nocturne"
      when 15
        browse_by_expansion "Renaissance"
      when 16
        browse_menu
    end
   
  end

  def browse_by_expansion expansion

    Card.where(set_name: expansion).map do |card|
      output_card_info(card)
    end
  end

  def browse_all
    Card.all.map do |card|
        puts "Card Name: #{card.card_name} \n 
        Set Name: #{card.set_name} \n
        Type: #{card.type_of_card} \n
        Cost: #{card.cost} \n
        Text: #{card.card_text}\n"
    end
  end
  
  

  def search_by_name(card_name)
    card_searched = Card.all.find_by(card_name: card_name) # Need to add change to downcase
    output_card_info(card_searched)
  end

  def output_card_info(card_searched)
    puts "Card Name: #{card_searched.card_name}"
    puts "Set Number: #{card_searched.set_number}"
    puts "Set Name: #{card_searched.set_name}"
    puts "Type Of Card: #{card_searched.type_of_card}"
    puts "Kingdom Card: #{card_searched.is_kingdom_card}"
    puts "Cost: #{card_searched.cost}"
    puts "Card Text: #{card_searched.card_text}\n" 
  end

  def exit_message
    begin
      exit
    rescue SystemExit
      puts "May your dominion be large, prosperous, and efficient."
    end
  end

  def start_game
    welcome
    user_name
    main_menu
    #binding.pry
  end

end