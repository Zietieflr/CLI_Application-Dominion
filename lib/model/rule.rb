class Rule
  attr_accessor :number_of_players

  def initialize
    @number_of_players = 0
  end

  def rule_beginning_text
    more_than_four?
    confirm_players
    universal_rules
    victory_cards
    curses
  end

  def curses
    puts "Place #{(@number_of_players * 10) - 10} curse cards into the Supply."
  end

  def victory_cards
    case @number_of_players
    when 2
      puts 'Place 8 copies of each Estate, Dutchy, and Province cards into the Supply.'
    when 3..4
      puts 'Place 12 copies of each Estate, Dutchy, and Province cards into the Supply.'
    when 5
      puts 'Place 12 copies of each Estate and Dutchy cards into the Supply.'
      puts 'Place 15 Province Cards into the Supply.'
    when 6
      puts 'Place 12 copies of each Estate and Dutchy cards into the Supply.'
      puts 'Place 18 Province Cards into the Supply.'
    end
  end

  def universal_rules
    puts 'Deal each player 3 Estates and 7 Coppers. These will need to be shuffled.'
    puts "Then we\'ll build the Supply: "
    puts 'First add all gold, silver, and remaining copper to the Supply.'
  end

  def confirm_players
    puts "Let's get started! Here\'s what you need for #{@number_of_players} players: "
  end

  def more_than_four?
    if @number_of_players > 4
      puts "You\'ll need to have the Base Cards booster expansion to play a full game with #{@number_of_players} players."
    end
  end
end
