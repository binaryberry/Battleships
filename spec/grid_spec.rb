require 'grid'
require 'cell'
require 'ship'


describe Grid do

	let(:grid) 		{ Grid.new					}
	let(:destroyer) { Ship.new(2)				}
	let(:cell)		{ Cell.new("A1")			}
	let(:cruiser)	{ Ship.new(3)				}

	it 'is created with 100 cells' do
		expect(grid.create_cells.count).to eq 100
	end

	it 'can assign the ships to cells vertically' do
		grid.place(destroyer,"A1","vertically")
		expect(grid.cells["A1"].content). to eq destroyer
		expect(grid.cells["A2"].content). to eq destroyer
		grid.cells.reject {|key,cell| key == "A1" or key == "A2"}.each {|key,cell| expect(cell.content). to eq 'water'}
	end

	it 'can assign the ships to cells horizontally' do
		grid.place(destroyer,"A1","horizontally")
		expect(grid.cells["A1"].content). to eq destroyer
		expect(grid.cells["B1"].content). to eq destroyer 
	grid.cells.reject {|key,cell| key == "A1" or key == "B1"}.each {|key,cell| expect(cell.content). to eq 'water'}
	end

	it 'returns an error if there is already a ship where the user wants to place another ship (horizontally)' do
		grid.place(cruiser,"B1","vertically")
		expect(lambda{grid.place(destroyer,"A1","horizontally")}).to raise_error("Cannot place ship there")
	end

	it 'returns an error if there is already a ship where the user wants to place another ship (vertically)' do
		grid.place(cruiser,"A1","horizontally")
		expect(lambda{grid.place(destroyer,"B1","vertically")}).to raise_error("Cannot place ship there")
	end
end

