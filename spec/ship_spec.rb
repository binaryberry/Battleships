require './lib/ship.rb'


describe Ship do

	let(:length)	{ 5 }
	let(:name)		{ 'submarine' }
	let(:ship) 		{ Ship.new(length,name) }

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
			expect(ship.sunk?). to be false
		end

		it "is sunk once it has been hit on its entire length" do
			5.times {ship.hit!}
			expect(ship.sunk?). to be true
		end
	end
end
