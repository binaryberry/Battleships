require "cell"

describe Cell do

	let(:cell)  { Cell.new }
	let(:ship)  { double :ship }
	let(:water) { double :water}

	it "it is initialized with an empty status" do
		expect(cell.status).to eq nil
	end

	it 'is initialized with water as contents' do
		cell.content = water
		expect(cell.content).to eq water
	end

	it "knows when is occupied" do
		cell.content = ship
		expect(cell.content).to eq ship
	end

	it 'should be able to take a hit' do
		cell.hit!
		expect(cell.status).to eq 'hit'
	end

	it "should pass that information to the content" do
		cell.content = ship
		expect(ship).to receive(:hit)
		cell.hit!
	end

end