require_relative 'board.rb'
require_relative 'player.rb'

class Game
attr_accessor :board
attr_accessor :player_1
attr_accessor :player_2
attr_accessor :current_player

  def initialize
    @board=Board.new
    @player_1
    @player_2
    @current_player
  end

  def determine_players
    puts "Who is player 1? (enter your name)"
    name=gets.chomp
    puts "Which letter would you like to use as your token? (enter a letter)"
    token=gets.chomp
    @player_1 = Player.new(name, token)
    
    
    
    puts "Who is player 2? (enter your name)"
    name=gets.chomp
    puts "Which letter would you like to use as your token? (enter a letter)"
    token=gets.chomp
    until available_token?(token)
        puts "That letter has already been chosen. Please pick again. "
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
        current_player=@player_2
    else
        current_player=@player_1
    end
  end

  def take_turns
    switch_player
    puts "Make your selction by entering a row number."
    move = gets.chomp
    #this is unfinished - need to work on finishing board class first"

  end

  def play_game
    @board.display
  end
end

game=Game.new

game.play_game