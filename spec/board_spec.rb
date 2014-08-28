
require 'board'


describe Board do

let(:board) 			{ Board.new("Player Rihanna")				}
let(:destroyer) 	{ double :ship, {length: 2}					}

it 'is created with 100 cells' do
	expect(board.create_cells.count).to eq 100
end


xit 'asks the player for the hit location' do
	expect(board.ask_hit).to match(/[A-J]\d/)

end

end
