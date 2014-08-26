require "cell"

describe Cell do

	let(:cell) { Cell.new }

	it "has a status" do
		expect(cell.status).to eq true
	end

	it "it is initialized with an empty status" do
		expect(cell.status).to eq 'empty'
	end

end