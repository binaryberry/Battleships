require './lib/board'

describe Board do

let(:board) { Board.new	}

it 'is created with 100 cells' do
	expect(board.cells.count).to eq 100
end

end
