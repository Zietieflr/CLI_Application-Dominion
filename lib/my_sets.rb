require_relative '../config/environment.rb'

class MySet
  attr_accessor :user

  def initialize(user)
    @user = user
    @prompt = TTY::Prompt.new
  end

  def display_sets
    my_sets = find_my_sets
    case my_sets
    when []
      puts "You don't have any sets yet!"
    else
      cards_in_set(my_sets)
    end
  end

  # need to take display_sets and the object it returns and parse it into displaying the cards
  def cards_in_set(kingdom_card_sets)
    kingdom_card_set = @prompt.select('Choose Kingdom Card Set:', convert_to_menu(kingdom_card_sets), cycle: true)
    all_kingdom_card_set = KingdomCardSet.where(name: kingdom_card_set.name)
    cards = all_kingdom_card_set.map { |kingdom_set| Card.find(kingdom_set.card_id) }
    puts kingdom_card_set.name
    cards.each do |card|
      puts "Card Name: #{card.card_name}
        Set Name: #{card.set_name}
        Type: #{card.type_of_card}
        Cost: #{card.cost}
        Text: #{card.card_text}\n \n"
    end
  end

  def what_next?
    menu = {
     'Back to Main menu' => 1}
     @prompt.select("What's next?", menu, cycle: true)
    case menu
    when 1
      my_sets = find_my_sets
      cards_in_set(my_sets)
    when 2
      nil
    end
  end

  def convert_to_menu(kc_sets)
    kc_sets.reduce({}) do |menu, kc_set|
      menu[kc_set.name] = kc_set
      menu
    end
  end

  def find_my_sets
    KingdomCardSet.where(user_id: @user.id)
  end
end

# andrew = User.find_by(user_name: 'Andrew')
# logan = User.find_by(user_name: 'Logan')
# my_sets = MySets.new(andrew)
# log_sets = MySets.new(logan)
# binding.pry
