# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'display'

# defines the game play
class Game
  attr_accessor :board, :player1, :player2, :current_player

  include Display

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def determine_players
    # player 1 selection
    player_1_selection_prompt
    name = gets.chomp.strip
    token_selection_prompt
    token = gets.chomp.strip
    until one_letter?(token)
      illegal_token_prompt
      token = gets.chomp.strip
    end
    @player1 = Player.new(name, token)
    # player 2 selection
    player_2_selection_prompt
    name = gets.chomp.strip
    token_selection_prompt
    token = gets.chomp.strip
    until available_token?(token)
      choose_another_token_prompt
      token = gets.chomp
    end
    until one_letter?(token)
      illegal_token_prompt
      token = gets.chomp.strip
    end
    @player2 = Player.new(name, token)
  end

  def available_token?(choice)
    if choice == @player1.token
      false
    else
      true
    end
  end

  def one_letter?(choice)
    return true if choice.length == 1
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def take_turns
    until @board.board_full? ||
          @board.row_winner? ||
          @board.column_winner? ||
          @board.diagonal_upleft_winner? ||
          @board.diagonal_upright_winner?
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

  def conclusion
    @board.display
    if @board.board_full?
      tie_prompt
    elsif @board.row_winner? ||
          @board.column_winner? ||
          @board.diagonal_upleft_winner? ||
          @board.diagonal_upright_winner?
      winner_prompt
    end
  end
end
