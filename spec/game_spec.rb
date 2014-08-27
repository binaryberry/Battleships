require 'game'

describe Game do

	let(:player1) { double :player  	}
	let(:player2) { double :player  	}
	let(:board1)		{ double :board 		}
	let(:game)		{ Game.new					}

	it "should initialize 2 players" do		
		expect(game.player1).to be_a(Player) 
	end
	
	it "should initialize 2 boards" do		
		expect(game.board1).to be_a(Board) 
	end

	xit 'asks the player to place the ships' do
	expect(game.ask_placement(board1)).to match([/[A-Z]\d\d/,/[A-Z]\d\d/]) 
	end

  
end