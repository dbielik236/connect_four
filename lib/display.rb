# frozen_string_literal: true

# contains all of the display prompts
module Display
  def welcome_prompt
    puts 'Let\'s play CONNECT FOUR!'
  end

  def player_1_selection_prompt
    puts 'Who is player 1? (enter your name)'
  end

  def player_2_selection_prompt
    puts 'Who is player 2? (enter your name)'
  end

  def token_selection_prompt
    puts 'Which letter would you like to use as your token? (enter a letter)'
  end

  def choose_another_token_prompt
    puts 'That letter has already been chosen. Please pick again.'
  end

  def row_selection_prompt
    puts "#{@current_player.name}, make your selection by entering a row number."
  end

  def illegal_move_prompt
    puts 'Not a playable row. Please choose again'
  end

  def illegal_token_prompt
    puts 'Don\'t get greedy! Just choose one letter for your token.'
  end

  def tie_prompt
    puts 'Wow, you filled up the whole board! I guess it\'s a tie?'
  end

  def winner_prompt
    puts "Congratulations #{@current_player.name}, you won!"
  end

  def play_again_prompt
    puts 'Would you like to play again? (y/n)'
  end

  def end_prompt
    puts 'Thanks for playing!'
  end
end
