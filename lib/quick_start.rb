require 'pry'

class QuickStart
  def initialize
    @rules = Rule.new
    @prompt = TTY::Prompt.new
    @random_set = []
  end

  def process_number_of_players(players)
    case players
    when 1
      puts "You'll need at least one other player for Dominion!"
      quick_start
    when 2..6
      rules_for_number_of_players(players)
    when 7..15
      puts 'You have too many players! Dominion supports 2-4 '\
        'players (5-6 with the Base Cards add on)!'
      quick_start
    else
      puts 'Sorry, that was not a usable number of players! '\
        'Please enter a number between 2 and 6!'
      quick_start
    end
  end

  def number_of_players
    gets.strip.to_i
  end

  def rules_for_number_of_players(players)
    @rules.player_count = players
    @rules.rule_beginning_text
  end

  def quick_start_welcome
    puts 'Here we go! This guide will help you get your game set up quickly and efficiently.'
  end

  def ask_for_players
    print 'Please enter the number of players: '
  end

  def choose_kingdom_cards_menu
    choices = {
      'Choose from My Sets' => 1,
      'Generate Random Set' => 2
    }
    @prompt.select('Choose Option:', choices, cycle: true)
  end 

  def choose_kingdom_cards
    case choose_kingdom_cards_menu
    when 1
      print_kingdom_cards(my_sets_menu)
    when 2
      print_kingdom_cards(random_kingdom_card_set)
    end
  end

  def random_kingdom_card_set
    'Random Set'
  end

  def make_menu_from_my_sets
    # make a hash from My Sets for menu options
    {
      'Default 1' => 'Default 1',
      'Default 2' => 'Default 2'
    }
  end

  def my_sets_menu
    choices = make_menu_from_my_sets
    @prompt.select('Choose Kingdom Card Set:', choices, cycle: true)
  end

  def print_kingdom_cards(kingdom_card_set)
    puts "Your cards from #{kingdom_card_set}: "
    puts " Card \n Card \n Card \n Card"
  end

  def end_game_conditions
    @rules.end_conditions
    new_game
  end

  def new_game
    choices = {
      'New Game' => 1,
      'Main Menu' => 2
    }
    case @prompt.select('What next?', choices, cycle: true)
    when 1
      quick_start
    when 2
      nil
    end
  end

  def quick_start
    ask_for_players
    process_number_of_players(number_of_players)
    choose_kingdom_cards
    end_game_conditions
  end
end
<<<<<<< HEAD
<<<<<<< HEAD


=======
>>>>>>> 5052b66b03a2cae3dc8115d2f3778198cdcce386
=======
>>>>>>> f8b05060935cb84848555d2179e3a9b9c2226503
