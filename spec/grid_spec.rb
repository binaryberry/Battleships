require 'grid'
require 'cell'
require 'ship'


describe Grid do

	let(:grid) 		{ Grid.new("john")					}
	let(:destroyer) { Ship.patrol_boat		}
	let(:cell)		{ Cell.new("A1")			}
	let(:cruiser)	{ Ship.destroyer				}	

	it 'is created with 100 cells' do
		expect(grid.create_cells.count).to eq 100
	end

	context 'Vertical placement' do
		before do
			grid.place(destroyer,"A1","vertically")
		end

		it 'can assign the ships to first cell vertically' do
			expect(grid.cells["A1"].content). to eq destroyer
		end

		it 'can assign the ships to subsequent cells vertically' do
			expect(grid.cells["A2"].content). to eq destroyer
		end	

		it 'can assign the ships to cells vertically and leave the rest of the grid ugitnchanged' do
			grid.cells.reject {|key,cell| key == "A1" or key == "A2"}.each {|key,cell| expect(cell.content). to eq 'water'}
		end
	end

	it 'can assign the ships to cells vertically' do
		grid.place(destroyer,"A1","vertically")
		expect(grid.cells["A1"].content). to eq destroyer
		expect(grid.cells["A2"].content). to eq destroyer
		grid.cells.reject {|key,cell| key == "A1" or key == "A2"}.each {|key,cell| expect(cell.content). to eq 'water'}
	end

	context 'Horizontal placement' do
		
		before do
			grid.place(destroyer,"A1","horizontally")
		end

		it 'can assign the ships to first cell horizontally' do
			expect(grid.cells["A1"].content). to eq destroyer
		end

		it 'can assign the ships to subseqent cells horizontally' do
			expect(grid.cells["B1"].content). to eq destroyer 
		end

		it 'can assign the ships to cells horizontally and leave the rest of the grid unchanged' do
			grid.cells.reject {|key,cell| key == "A1" or key == "B1"}.each {|key,cell| expect(cell.content). to eq 'water'}
		end
	end

	it 'returns an error if there is already a ship where the user wants to place another ship (horizontally)' do
		grid.place(cruiser,"B1","vertically")
		expect(lambda{grid.place(destroyer,"A1","horizontally")}).to raise_error("Cannot place ship on another ship")
	end

	it 'returns an error if there is already a ship where the user wants to place another ship (vertically)' do
		grid.place(cruiser,"A1","horizontally")
		expect(lambda{grid.place(destroyer,"B1","vertically")}).to raise_error("Cannot place ship on another ship")
	end

	it 'returns miss when water is hit' do
		grid.hit("A1")
		expect(grid.cells["A1"].status).to eq 'miss'
	end

	it 'returns hit when a ship is hit' do
		grid.place(destroyer, "A1", "vertically")
		grid.hit("A1")
		expect(grid.cells["A1"].status).to eq 'hit'	
	end

	it 'returns an error message when a cell is being hit twice' do
		grid.hit("A1")
		expect{grid.hit("A1")}.to raise_error('this cell has already been hit')
	end

	it "returns an error if you try to place a ship on a nonexistant cell" do
		expect(lambda{grid.place(destroyer, "J10", "horizontally")}).to raise_error('You cannot place a ship there')
	end

end