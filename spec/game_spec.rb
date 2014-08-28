require 'game'
require "grid"
require 'cell'
require "player"

describe Game do

	let(:player_1)     { double :player, grid: nil, all_ships_sunk?: nil , name: "Rihanna" 	}
	let(:player_2)     { double :player, grid: nil, name: "Albert" 	    }



	let(:destroyer)   { double :ship                     }
	let(:game)		    { Game.new(player_1.name, player_2.name)			}


	it "should initialize 2 players" do		
	expect(game.player_1).to be_a(Player)   
	expect(game.player_2).to be_a(Player) 
	end


	it "should be player1's turn" do

		expect(game.turn.name).to eq player_1.name

	end
	
	it "at the beginning player_2 is going to be the opponent" do
		expect(game.opponent.name).to eq player_2.name
	end

	it "should be able to place a ship for a player" do
		expect(player_1.grid).to receive(:place).with destroyer, "A1", "vertically"
		game.place(destroyer, on_behalf_of: player_1, on_cell: "A1", facing: "vertically")
	end


	it "should allow a player to take a shot" do
	allow(player_2.grid).to receive(:hit).with("B2")
	game.shoot("B2")
	end

	it "should ask if player_1 has won" do
	 	allow(player_2.grid).to receive(:hit).with("B2")
		expect(game).to receive(:winner?).with(game.player_1)
		game.shoot("B2")

	end

	it "should ask the players' grid if all ships are sunk when asking for a winner" do
		expect(player_1).to receive(:all_ships_sunk?)
		game.winner?(player_1)
	end

	it "should switch to player_2's turn after player_1 takes a shot" do
	 allow(player_2.grid).to receive(:hit).with("B2")
		game.shoot("B2")
		expect(game.turn.name).to eq player_2.name
	end

	it "should change the opponent after a turn is finished" do
		game.switch_turn
		expect(game.opponent).to be game.player_1
	end

	it "creates 5 ships per player when initialized" do
		# allow(player_1.grid).to receive(:ships)
		expect(game.create_ships.count).to eq 5
	end
end