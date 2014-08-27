require "player"

describe Player do
  
let(:player) {Player.new("Rihanna")}
let(:board) {double :board}

it "is created with a name" do

expect(player.name).to eq "Rihanna"
end

it "should be given a board" do
player.add_board(board)
expect(player.board).to eq board
end


end