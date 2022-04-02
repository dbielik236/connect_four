# frozen_string_literal: true

# Controls the grid, legals moves, replaces tokens and checks if there is a winner or tie
class Board
  attr_accessor :grid

  def initialize
    @grid = [
      [' ', ' ', ' ', ' ', ' ', ' ', ' '], 
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ']
    ]
  end

  def display
    puts "
       |_#{grid[5][0]}_|_#{grid[5][1]}_|_#{grid[5][2]}_|_#{grid[5][3]}_|_#{grid[5][4]}_|_#{grid[5][5]}_|_#{grid[5][6]}_|
       |_#{grid[4][0]}_|_#{grid[4][1]}_|_#{grid[4][2]}_|_#{grid[4][3]}_|_#{grid[4][4]}_|_#{grid[4][5]}_|_#{grid[4][6]}_|
       |_#{grid[3][0]}_|_#{grid[3][1]}_|_#{grid[3][2]}_|_#{grid[3][3]}_|_#{grid[3][4]}_|_#{grid[3][5]}_|_#{grid[3][6]}_|
       |_#{grid[2][0]}_|_#{grid[2][1]}_|_#{grid[2][2]}_|_#{grid[2][3]}_|_#{grid[2][4]}_|_#{grid[2][5]}_|_#{grid[2][6]}_|
       |_#{grid[1][0]}_|_#{grid[1][1]}_|_#{grid[1][2]}_|_#{grid[1][3]}_|_#{grid[1][4]}_|_#{grid[1][5]}_|_#{grid[1][6]}_|
       |_#{grid[0][0]}_|_#{grid[0][1]}_|_#{grid[0][2]}_|_#{grid[0][3]}_|_#{grid[0][4]}_|_#{grid[0][5]}_|_#{grid[0][6]}_|
      "
  end

  def legal_move?(num)
    num >= 1 && num <= 7 && @grid[5][num - 1] == ' '
  end

  def replace_token(col, token)
    if @grid[0][col - 1] == ' '
      @grid[0][col - 1] = token
    elsif @grid[1][col - 1] == ' '
      @grid[1][col - 1] = token
    elsif @grid[2][col - 1] == ' '
      @grid[2][col - 1] = token
    elsif @grid[3][col - 1] == ' '
      @grid[3][col - 1] = token
    elsif @grid[4][col - 1] == ' '
      @grid[4][col - 1] = token
    else
      @grid[5][col - 1] = token
    end
  end

  def board_full?
    @grid.each do |row|
      row.each do |value|
        return false if value == ' '
      end
    end
  end

  def winner?
  end
end
