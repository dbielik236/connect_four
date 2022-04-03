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
         1   2   3   4   5   6   7
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

  def row_winner?
    result = false
    @grid.each do |row|
      next if row[3] == ' '
      return result if row[2] != row[3] && row[4] != row[3]

      if row[2] == row[3] && row[4] != row[3]
        return result = true if row[0] == row[3] && row[1] == row[3]
      elsif row[2] != row[3] && row[4] == row[3]
        return result = true if row[5] == row[3] && row[6] == row[3]
      elsif row[2] == row[3] && row[4] == row[3]
        return result = true if row[1] == row[3] || row[5] == row[3]
      end
    end
    result
  end



  def column_winner?
    result = false
    queue = []
    current_column = 0
    while current_column <= 6
      @grid.each do |row|
        queue << row[current_column]
      end
      counter = 1
      index = 1
      until counter == 4 || index == 6
        if queue[index - 1] != ' ' && queue[index] == queue[index - 1]
          counter += 1
        else
          counter = 1
        end
        index += 1
      end
      if counter == 4
        result = true
        break
      end
      break if result == true

      current_column += 1
      queue = []
    end
    result
  end

  def diagonal_upright_winner?
    result = false
    possible_starters = [
      [0, 0], [0, 1], [0, 2], [0, 3],
      [1, 0], [1, 1], [1, 2], [1, 3],
      [2, 0], [2, 1], [2, 2], [2, 3]
    ]
    possible_starters.each do |loc|
      row, column = loc
      counter = 1
      3.times do
        if @grid[row + 1][column + 1] == @grid[row][column] && @grid[row][column] != ' '
          counter += 1
        end
        row += 1
        column += 1
      end
      if counter == 4
        result = true
        break
      end
    end
    result
  end

  def diagonal_upleft_winner?
    result = false
    possible_starters = [
      [0, 3], [0, 4], [0, 5], [0, 6],
      [1, 3], [1, 4], [1, 5], [1, 6],
      [2, 3], [2, 4], [2, 5], [2, 6]
    ]
    possible_starters.each do |loc|
      row, column = loc
      counter = 1
      3.times do
        if @grid[row + 1][column - 1] == @grid[row][column] && @grid[row][column] != ' '
          counter += 1
        end
        row += 1
        column -= 1
      end
      if counter == 4
        result = true
        break
      end
    end
    result
  end
end
