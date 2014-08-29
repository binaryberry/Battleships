require './lib/score'

describe Score do


	let(:ship) {double :ship}
	let(:bob) {double :player, ships: [:ship,:ship2,:ship3,:ship4,:ship5]}
	let(:score) {Score.new}
	let(:game) {double :game}

	it 'knows when a ship has been sunk' do
		expect(ship).to receive(:sunk?).with(score).and_return(true)	
		score.red_alert(ship)
	end


	it 'knows whose ship has been sunk' do
		expect(ship).to receive(:sunk?).with(score).and_return(true)	
		score.red_alert(ship)
		expect(ship.player).to eq "bob"	
	end

	it 'should know how many ships have been sunk for each player' do
		expect(ship).to receive(:sunk?).with(score).and_return(true)	
		score.red_alert(ship)
		expect(score.number_of_ships_left?(bob)).to eq ships.count
	end




end
