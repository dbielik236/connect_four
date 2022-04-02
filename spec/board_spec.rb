# frozen_string_literal: true

require './lib/game'
require './lib/board'

describe Board do
  describe '#legal_move?' do
    it 'tells if the move is legal or not' do
      board = Board.new
      expect(board.legal_move?(4)).to eql(true)
    end
  end
end
