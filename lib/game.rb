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

  def select_token(num)
    if num=="1"
      token="★"
    elsif num=="2"
      token="♥"
    elsif num=="3"
      token="⚡"
    elsif num=="4"
      token="⚽"
    elsif num=="5"
      token="⚾"
    else
      puts "Not a valid choice"
    end
  end
    
  def determine_players(player=player_1)
    puts "Who is player 1? (enter your name)"
    name=gets.chomp
    puts "Which token would you like to use? (enter the number)\n
    1.) ★\n
    2.) ♥\n
    3.) ⚡\n
    4.) ⚽\n
    5.) ⚾" 
    while token==nil
        choice=gets.chomp
        token=select_token(choice)
    end
    player = Player.new(name, token)
    determine_players(player_2)
  end
end


