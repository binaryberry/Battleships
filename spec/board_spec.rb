
require 'board'


describe Board do

let(:board) 		{ Board.new					}
let(:destroyer) 	{ double :ship, {length: 2}	}

it 'is created with 100 cells' do
	expect(board.create_cells.count).to eq 100
end


it 'is created with five new ships' do
	expect(board.create_ships.count).to eq 5
end

it 'asks the player to place the ships' do
	expect(board.ask_placement(destroyer)).to match([/[A-Z]\d\d/,/[A-Z]\d\d/]) 
end

end
