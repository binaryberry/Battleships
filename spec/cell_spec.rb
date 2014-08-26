require "cell"

describe Cell do

	let(:cell)  { Cell.new }
	let(:ship)  { double :ship }

	it "it is initialized with an empty status" do
		expect(cell.status).to eq nil
	end

	it 'is initialized with water as contents' do
		expect(cell.content).to eq 'water'
	end

	it "should change its content to ship when receives a ship" do
		cell.receive(ship)
		expect(cell.content).to eq ship
	end

	it 'should be able to take a hit' do
		expect(cell).to respond_to(:hit_it)
	end

	it "should return 'miss' if the content is water" do
		cell.hit_it
		expect(cell.status).to eq 'miss'
	end

	it "should return 'hit' if the content is a ship" do
		expect(ship).to receive(:hit!)
		cell.content = ship
		cell.hit_it
		expect(cell.status).to eq 'hit'
	end

	it 'should know its grid number' do
		
	end

end