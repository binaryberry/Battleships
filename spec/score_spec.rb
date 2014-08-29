require './lib/score'

describe Score do

	let(:ship) {double :ship}
	let(:score) {Score.new}
	let(:game) {double :game}

	it 'knows when a ship has been sunk' do
		expect(ship).to receive(:sunk?).with(score).and_return(true)	
		score.red_alert(ship)
	end

	# it 'knows whose ship has been sunk' do
	# 	expect(ship).to receive(:sunk?).with(score).and_return(true)	
		
	# 	expect(score.check_ship_owner).to return(player1.name)
	# end


end