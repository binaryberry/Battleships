require './lib/score'
require './lib/game.rb'

describe Score do


	let(:ship) {double :ship}
	let(:bob) {double :player, ships: [:ship,:ship2,:ship3,:ship4,:ship5]}
	let(:score) {Score.new}
	let(:game) {double :game}
	let(:new_game) 	{Game.new("joe","amy")}
	let(:player_1)	{double :player, id: "player_1"}

	it 'knows when a ship has been sunk' do
		allow(ship).to receive(:sunk?).and_return(true)	
	end

	it "should check if the ship at coordinates on a player's grid has been sunk" do
		new_game.player_1.grid.cells["A1"].content = new_game.player_1.ships[:patrol_boat]
		new_game.player_1.grid.cells["A2"].content = new_game.player_1.ships[:patrol_boat]
		new_game.player_1.grid.cells["A1"].hit_it!
		new_game.player_1.grid.cells["A2"].hit_it!
		score.check(new_game.player_1)
		expect(score.counter_player1).to be 1
	end

	it "should declare the winner if all the ships are sunk" do
		score.counter_player2 = 5
		expect(score.winner?(player_1)).to be true
	end



end
