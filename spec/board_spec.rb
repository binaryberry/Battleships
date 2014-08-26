
require 'board'


describe Board do

let(:board) { Board.new	}

it 'is created with 100 cells' do
	expect(board.create_cells.count).to eq 100
end


it 'is created with five new ships' do
	expect(board.create_ships.count).to eq 5
end

xit 'asks the player to place the ships' do
	expect()
end

end
