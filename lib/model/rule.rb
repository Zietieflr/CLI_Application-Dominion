class Rule
  attr_accessor :player_count

  def initialize
    @player_count = 0
  end

  def rule_beginning_text
    more_than_four?
    confirm_players
    universal_rules
    victory_cards
    curses
  end

  def curses
    puts "Place #{(@player_count * 10) - 10} curse cards into the Supply.\n \n"
  end

  def victory_cards
    case @player_count
    when 2
      puts 'Place 8 copies of each Estate, Dutchy, and Province cards into the Supply.\n'
    when 3..4
      puts 'Place 12 copies of each Estate, Dutchy, and Province cards into the Supply.'
    when 5
      puts 'Place 12 copies of each Estate and Dutchy cards into the Supply.'
      puts 'Place 15 Province Cards into the Supply.\n'
    when 6
      puts 'Place 12 copies of each Estate and Dutchy cards into the Supply.'
      puts "Place 18 Province Cards into the Supply.\n"
    end
  end

  def universal_rules
    puts 'Deal each player 3 Estates and 7 Coppers. These will need to be shuffled.'
    puts "Then we\'ll build the Supply: "
    puts 'First add all gold, silver, and remaining copper to the Supply.'
  end

  def confirm_players
    puts "\nLet's get started! Here\'s what you need for #{@player_count} players: "
  end

  def more_than_four?
    if @player_count > 4
      puts "You\'ll need to have the Base Cards booster expansion to play a full game with #{@player_count} players."
    end
  end

  def end_conditions
    case @player_count
    when 2..4
      puts "The game ends at the start of a player's turn when: \n"\
        "Province Supply pile is empty. \n or \n"\
        "Three or more Supply piles are empty.\n \n"
    when 5..6
      puts "The game ends at the start of a player's turn when: \n"\
        "    Province Supply pile is empty. \n         OR \n"\
        "    Four or more Supply piles are empty.\n \n"
    end
  end
end
