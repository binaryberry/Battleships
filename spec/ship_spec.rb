require './lib/ship.rb'


describe Ship do

	let(:length)	{ 5 }
	let(:name)		{ 'submarine' }
	let(:player)	{ double :player	}
	let(:ship) 		{ Ship.new(length,name) }
	let(:score)		{double :score}

	context "Initialization" do

		it "should have a length when created" do
			expect(ship.length). to be 5
		end

		it "should know its name" do
			expect(ship.name).to eq 'submarine'
		end

		it "should have a hit count of zero when it is created" do
			expect(ship.hit_count). to be 0
		end

		it "has not been placed when it is created" do 
			expect(ship.placed?). to be false
		end

		it "can be placed" do
			ship.place!
			expect(ship.placed?). to be true
		end

	end

	context "Game play" do

		it "recognises each time it has been hit" do
			ship.hit!
			expect(ship.hit_count). to be 1
		end

		it "has not been sunk when it is created" do
			expect(ship.sunk?(score)). to be false
		end

		it "is sunk once it has been hit on its entire length" do
			5.times {ship.hit!}
			allow(score).to receive(:red_alert).with(ship)
			expect(ship.sunk?(score)). to be true
		end

		it "tells score that a ship has sunk" do
			expect(score).to receive(:red_alert).with(ship)
			5.times {ship.hit!}
			ship.sunk?(score)
		end
	end
end
