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

      @user_name_input = get_user_input

      user = User.find_by(user_name: @user_name_input)

      if user
        while user
        puts "Sorry, this name has been taken."
        puts "Try another name: "
        @user_name_input = get_user_input
        user = User.find_by(user_name: @user_name_input)
        end
        puts "Welcome #{@user_name_input}, We're here to help you conquer your Dominion!"
      else
        User.create(user_name: @user_name_input)
        puts "Welcome #{@user_name_input}, We're here to help you conquer your Dominion!"
      end
    else
      puts "Enter your user name: "
      @user_name_input = get_user_input
      puts "Welcome back #{@user_name_input}, We're here to help you conquer your Dominion!"
      
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
        create_set_menu
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

  def create_set_menu
  
    create_set_choices = {
      "Create New Set" => 1,
      "Update Set" => 2,
      "Delete Set" => 3,
      "Main Menu" => 4
    }
    create_set_answer = menu_prompt(create_set_choices)

    case create_set_answer
      when 1
        create_set
      when 2
        update_set
      when 3
        delete_set
      when 4
        main_menu
    end
  end

  def create_set
    puts "What Would You Like To Name You New Set: "
    new_set_name = get_user_input

    puts "Which Kingdom Card Would You Like To Add: "
    new_card_to_add = get_user_input

    if Card.find_by(card_name: new_card_to_add) && Card.find_by(is_kingdom_card: 1)
      card_id = Card.find_by(card_name: new_card_to_add).id
      user_id = User.find_by(user_name: @user_name_input).id

      KingdomCardSet.create(name: new_set_name, user_id: user_id, card_id: card_id)

    
      add_another_card = prompt.yes?("Would You Like To Add Another Card:  (Y/n)")

      while add_another_card
        puts "What Kingdom Card Would You Like To Add: "
        new_card_to_add = get_user_input    

        card_id = Card.find_by(card_name: new_card_to_add).id
        user_id = User.find_by(user_name: @user_name_input).id

        KingdomCardSet.create(name: new_set_name, user_id: user_id, card_id: card_id)

        if KingdomCardSet.where(name: new_set_name).count == 10
          puts "You have reached maximum number of cards in a set."
          break
        end
        add_another_card = prompt.yes?("Would You Like To Add Another Card:  (Y/n)")
      end
    else
      puts "Not A Valid Card Name."
      puts "Try Creating A Set Again."
      create_set
    end
    create_set_menu
  end


  def delete_set
    puts "Please Enter The Name Of The Set You Would Like to Delete: "
    set_to_delete = get_user_input
    KingdomCardSet.destroy_by(name: set_to_delete)
    create_set_menu
  end


  def update_set
    update_choices = {
      "Change Set Name" => 1,
      "Remove Card From Set" => 2,
      "Add Card to Set" => 3,
      "Create Set Menu" => 4
    }
    update_set_answer = menu_prompt(update_choices)
    case update_set_answer
      when 1
        change_set_name
      when 2
        delete_card_from_set
      when 3
        add_card
      when 4
        create_set_menu
    end
  end

  def add_card
    puts "What Set Would You Like To Add To: "
    set_to_add = get_user_input
    puts "What Card Would You Like To Add: "
    card_to_add = get_user_input
    if KingdomCardSet.find_by(name: set_to_add)
      if Card.find_by(card_name: card_to_add)
        user_id = User.find_by(user_name: @user_name_input).id
        card_id = Card.find_by(card_name: card_to_add).id
        KingdomCardSet.create(name: set_to_add,user_id: user_id, card_id: card_id )
      else
        puts "Card Was Not Found In Set."
      end
    else 
      puts "Set Not Found."
      add_card
    end
    create_set_menu 
  end

  def delete_card_from_set
    puts "Please Enter Set You Would Like Card Removed From:"
    set_name = get_user_input
    puts "Please Enter Card You Would Like To Remove: "
    card_to_remove = get_user_input

    if KingdomCardSet.find_by(name: set_name)
      card_to_remove_id = Card.find_by(card_name: card_to_remove).id
      specific_card = KingdomCardSet.find_by(name: set_name, card_id: card_to_remove_id)
      puts "Your Card Has Been Removed."
    else
      puts "That Set Does Not Exist."
    end
    create_set_menu
  end

  def change_set_name
    puts "Please Enter The Name Of The Set You Would Like to Update: "
    set_to_update = get_user_input
    set_name_current = KingdomCardSet.find_by(name: set_to_update)
    puts "Please Enter New Name: "
    new_name = get_user_input
    set_name_current.update(name: new_name)
    create_set_menu
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
  end

end