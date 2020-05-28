class BrowseCards
    # search by name
    # expansion search
    # browse all
    def prompt
        TTY::Prompt.new
    end

    def browse_menu
        browse_choices = {
            "Browse By Expansion" => 1,
            "Browse By Set" => 2,
            "Browse All" => 3,
            "Search By Name" => 4,
            "Main Menu" => 5
        }

        browse_answer = prompt.select("Choose Option:", browse_choices, cycle: true)

        case browse_answer
          when 1
            menu_prompt
          when 2
            menu_prompt
          when 3
            browse_all
          when 4
            puts "Enter Card Name: "
            search_by_name(get_user_input)
          when 5
            Cli.new.main_menu
        end
    end

    def search_by_name(card_name)
        puts Card.all.find_by(card_name: card_name.to_s) 
    end

    

    def browse_all
        Card.all.map do |card|
            puts "Card Name: #{card.card_name} \n 
            Set Name: #{card.set_name} \n
            Type: #{card.type_of_card} \n
            Cost: #{card.cost} \n
            Text: #{card.card_text}"
        end
    end
end