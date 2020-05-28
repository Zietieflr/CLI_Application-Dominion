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




  def main_menu 
    choices = {
      'Quick Start/Setup' => 1, 
      'Browse Cards' => 2 ,
      'Create Set' => 3, 
      'My Sets' => 4, 
      'My Expansions' => 5, 
      'Exit' => 6}
    answer = prompt.select("Choose Option:", choices, cycle: true)

    case answer 
      when 1
        quick_start
      when 2
        browse_cards
      when 3
        create_set
      when 4
        my_sets
      when 5
        my_expansions
      when 6
        exit
    end 
  end

  def start_game
    welcome
    user_name
    main_menu
  end
end