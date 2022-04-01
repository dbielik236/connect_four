require './lib/game'
require './lib/board'

describe Game do 
    describe "#select_token" do 
        it "selects the correct game token" do 
            game = Game.new
            expect(game.select_token("6")).to eql(nil)
        end
    end
end



