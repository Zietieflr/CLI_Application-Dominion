require 'pry'

class QuickStart
  def process_number_of_players(players)
    case players
    when 1
      puts "You'll need at least one other player for Dominion!"
      quick_start
    when 2..6
      rules_for_number_of_players(players)
    when 7..15
      puts 'You have too many players! Dominion supports 2-4 players (5-6 with the Base Cards add on)!'
      quick_start
    else
      puts 'Sorry, that was not a usable number of players! Please enter a number between 2 and 6!'
      quick_start
    end
  end

  def number_of_players
    gets.strip.to_i
  end

  def rules_for_number_of_players(players)
    puts 'Rules here.'
  end

  def quick_start_welcome
    puts 'Here we go! This guide will help you get your game set up quickly and efficiently.'
  end

  def ask_for_players
    print 'Please enter the number of players: '
  end

  def quick_start
    ask_for_players
    process_number_of_players(number_of_players)
  end
end

quick_menu = QuickStart.new
quick_menu.quick_start_welcome
quick_menu.quick_start
