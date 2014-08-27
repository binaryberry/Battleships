require "cell"
require 'ship'

describe Cell do

	let(:cell)  { Cell.new('A1') }
	let(:ship)  { double :ship }
	let(:destroyer) {Ship.new(5)}

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

	it 'when initialized it should know its coordinates' do
		expect(cell.coordinates).to match /[A-J]{1}\d{1}/
	end

	it 'should print an "o" if the cell contains water' do
		expect{cell.print_cell}. to output("~").to_stdout
	end

	it 'should print an "#" if the cell contains a ship' do
		cell.receive destroyer
		cell.print_cell
		expect{cell.print_cell}. to output("#").to_stdout	
	end

	it 'should print an "x" if the cell is hit and contains a ship' do
		cell.receive destroyer
		cell.hit_it
		expect{cell.print_cell}. to output("x").to_stdout
	end

	it 'should print "*" if the cell is hit [i.e. "miss"] and does not contain a ship' do
		cell.hit_it
		expect{cell.print_cell}. to output("*").to_stdout
	end

end