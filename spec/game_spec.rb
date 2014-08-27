require 'game'

describe Game do

	let(:player1) { double :player  	}
	let(:player2) { double :player  	}
	let(:board1)		{ double :board 	}
	let(:game)		{ Game.new					}
	let(:ship) { double :ship }

	it "should initialize 2 players" do		
		expect(game.player1).to be_a(Player) 
	end
	
	it "should initialize 2 boards" do		
		expect(game.board1).to be_a(Board) 
	end

	it 'asks the player to place the ships' do
	expect(ship).to receive(:length).and_return(3)
	expect(board1).to receive(:ships).and_return([ship])
	expect(game.ask_placement(board1)).to match([/[A-Z]\d\d/,/[A-Z]\d\d/]) 
	end

  
end