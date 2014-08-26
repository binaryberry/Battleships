require "cell"

describe Cell do

	let(:cell) { Cell.new }

	it "knows that is empty" do
		expect(cell).to be_empty
	end

end