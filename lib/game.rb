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
    name = gets.chomp
    token_selection_prompt
    token = gets.chomp
    @player1 = Player.new(name, token)
    # player 2 selection
    player_2_selection_prompt
    name = gets.chomp
    token_selection_prompt
    token = gets.chomp
    until available_token?(token)
      choose_another_token_prompt
      token = gets.chomp
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

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def take_turns
    until @board.board_full? || @board.row_winner? || @board.column_winner?
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

game = Game.new

game.determine_players
game.take_turns

