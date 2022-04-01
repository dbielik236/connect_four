
module Display

    def player_1_selection_prompt
        puts "Who is player 1? (enter your name)"
    end

    def player_2_selection_prompt
        puts "Who is player 2? (enter your name)"
    end

    def token_selection_prompt
        puts "Which letter would you like to use as your token? (enter a letter)"
    end

    def choose_another_token_prompt
        puts "That letter has already been chosen. Please pick again."
    end

    def row_selection_prompt
        puts "#{@current_player.name}, make your selction by entering a row number."
    end

    def illegal_move_prompt
        puts "Not a playable row. Please choose again"
    end

end
