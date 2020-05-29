require_relative '../config/environment.rb'

class MySets
  attr_accessor :user

  def initialize(user)
    @user = user
    @prompt = TTY::Prompt.new
  end

  def display_sets
    my_sets = find_my_sets
    case my_sets
    when nil
      puts "You don't have any sets yet!"
    else
      @prompt.select('Choose Kingdom Card Set:', convert_to_menu(my_sets), cycle: true)
    end
  end

  # need to take display_sets and the object it returns and parse it into displaying the cards

  def convert_to_menu(kc_sets)
    trial = kc_sets.reduce({}) do |menu, kc_set|
      menu[kc_set.name] = kc_set
      menu
    end
  end

  def find_my_sets
    KingdomCardSet.where(user_id: @user.id)
  end
end

andrew = User.find_by(user_name: 'Andrew')
my_sets = MySets.new(andrew)
binding.pry
