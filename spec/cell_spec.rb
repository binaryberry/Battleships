require "cell"

describe Cell do

	let(:cell) { Cell.new }
	let(:ship) { double :ship }

	it "it is initialized with an empty status" do
		expect(cell.status).to eq nil
	end

	it "knows when is occupied" do
		expect(cell.content).to eq ship
	end

end