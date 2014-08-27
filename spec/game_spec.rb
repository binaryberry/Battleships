require 'game'
require "board"
require 'cell'

describe Game do

	let(:player1)     { double :player, board: nil, all_ships_sunk?: nil  	}
	let(:player2)     { double :player, board: nil 	    }
	let(:destroyer)   {double :ship                     }
	let(:game)		    { Game.new(player1, player2)			}


	it "should initialize 2 players" do		
	expect(game.player1).to eq player1 
	expect(game.player2).to eq player2 
	end


	it "should be player1's turn" do
	expect(game.turn).to eq player1

	end
	
	it "at the beginning player2 is going to be the opponent" do
		expect(game.opponent).to eq player2
	end

	it "should be able to place a ship for a player" do
		expect(player1.board).to receive(:place).with destroyer, "A1", "vertically"
		game.place(destroyer, on_behalf_of: player1, on_cell: "A1", facing: "vertically")
	end


	it "should allow a player to take a shot" do
	expect(player2.board).to receive(:hit).with("B2")
	game.shoot("B2")
	end

	it "should ask if player1 has won" do
	 allow(player2.board).to receive(:hit).with("B2")
		expect(game).to receive(:winner?).with(player1)
		game.shoot("B2")

	end

	it "should ask the players' board if all ships are sunk when asking for a winner" do
		expect(player1).to receive(:all_ships_sunk?)
		game.winner?(player1)
	end

	it "should switch to player2's turn after player1 takes a shot" do
	 allow(player2.board).to receive(:hit).with("B2")
		game.shoot("B2")
		game.switch_turn
		expect(game.turn).to eq player2
	end

	it "should change the opponent after a turn is finished" do
		game.switch_turn
		expect(game.opponent).to eq player1
	end
end