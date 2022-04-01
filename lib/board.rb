
class Board
    attr_accessor :grid

    def initialize
      @grid = [
          [" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "],
          [" ", " ", " ", " ", " ", " ", " "],
          [" ", " ", " ", " ", " ", " ", " "],
          [" ", " ", " ", " ", " ", " ", " "],
          [" ", " ", " ", "b", " ", " ", " "]
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
      num >= 1 && num <=7 && @grid[5][num-1]==" "
    end
end

