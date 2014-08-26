
require 'board'


describe Board do

let(:board) { Board.new	}
let(:aircraft_carrier) { double :ship, {:length => 5} }
let(:battleship) { double :ship, {:length => 4} }
let(:submarine) { double :ship, {:length => 3} }
let(:destroyer) { double :ship, {:length => 3} }
let(:patrol_boat) { double :ship, {:length => 2} }

it 'is created with 100 cells' do
	expect(board.cells.count).to eq 100
end


# xit 'is created with five new ships' do
	
# 	expect(board.ship.count).to eq 5
# end

end
