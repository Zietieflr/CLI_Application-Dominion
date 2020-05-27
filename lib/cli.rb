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
    puts "Enter Your User Name: "
    user_name = get_user_input
    "Welcome #{user_name}, We're here to help you conquer your Dominion!"
    ########  check if in database if not add new user
    if  
      User.create()
  end

  def main_menu 
    choices = %w('Quick Start/ Setup' 'Browse Cards' 'Create Set' 'My Sets' 'My Expansions' 'Exit')
    prompt.select("Choose Option:", choices)
  end

  def start_game
    welcome
    user_name
    main_menu
  end
end