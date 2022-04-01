require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'display.rb'

class Game
attr_accessor :board, :player_1, :player_2, :current_player
include Display

  def initialize
    @board=Board.new
    @player_1
    @player_2
    @current_player
  end

  def determine_players
    player_1_selection_prompt
    name=gets.chomp
    token_selection_prompt
    token=gets.chomp
    @player_1 = Player.new(name, token)
    
    player_2_selection_prompt
    name=gets.chomp
    token_selection_prompt
    token=gets.chomp
    until available_token?(token)
        choose_another_token_prompt
        token=gets.chomp
    end
    @player_2 = Player.new(name, token)
  end

  def available_token?(choice)
    if choice==@player_1.token
        false
    else
        true 
    end
  end

  def switch_player
    if @current_player==@player_1
      @current_player=@player_2
    else
      @current_player=@player_1
    end
  end


  def take_turns
    until @board.board_full?
        switch_player
        @board.display
        row_selection_prompt
        move = gets.chomp
        until @board.legal_move?(move.to_i)
            illegal_move_prompt
            move = gets.chomp
        end
        @board.replace_token(move.to_i, @current_player.token)
    end
  end

  
end
    


game=Game.new

game.determine_players
game.take_turns