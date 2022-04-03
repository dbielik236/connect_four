# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'display'

include Display

def play_one_game
  game = Game.new
  game.determine_players
  game.take_turns
  game.conclusion
end

# plays game
def connect_four
  welcome_prompt
  play_one_game
  play_again_prompt
  answer = gets.chomp.strip
  until answer == 'y' || answer == 'n'
    puts play_again_prompt
    answer = gets.chomp.strip
  end
  if answer == 'y'
    connect_four
  else
    end_prompt
  end
end

connect_four
