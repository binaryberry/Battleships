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

	it 'returns an error if there is already a ship where the user wants to place another ship' do
		grid.place(cruiser,"B1","vertically")
		expect(lambda{grid.place(destroyer,"A1","horizontally")}).to raise_error("Cannot place ship there")
	end




	# it 'is created with five new ships' do
	# 	expect(grid.create_ships.count).to eq 5
	# end

	# it "print a line of the grid" do
	# 	expect{grid.print_line(1)}. to output("~~~~~~~~~~").to_stdout
	# end

	# it "prints a line of the grid with hits" do
	# 	grid.cells["A1"].hit_it
	# 	expect{grid.print_line(1)}. to output("*~~~~~~~~~").to_stdout
	# end

	# it "prints all the lines of the grid" do
	# 	expect{grid.print_grid}. to output("~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n~~~~~~~~~~\n").to_stdout
	# end
end

