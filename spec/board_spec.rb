require './lib/game'
require './lib/board'

describe Board do
    describe "#legal_move?" do 
        it "tells if the move is legal or not" do
            board = Board.new
            expect(board.legal_move?(9)).to eql(false)
        end
    end
end