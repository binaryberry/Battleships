require "cell"

describe Cell do

	let(:cell)  { Cell.new('A1') }
	let(:ship)  { double :ship   }
	let(:board) { double :board }


	context 'Is initialized' do
		
		it "with an empty status" do
			expect(cell.status).to eq nil
		end

		it 'with water as contents' do
			expect(cell.content).to eq 'water'
		end

		it 'knowing its coordinates' do
			expect(cell.coordinates).to match(/[A-J]{1}\d{1}/)
		end
	end

	context 'Interacting with the ship' do
		
		it "should change its content to ship when receives a ship" do
			expect(ship).to receive(:length)
			cell.receive(ship)
			expect(cell.content).to eq ship
		end

		it "should know the length of a ship" do
			expect(ship).to receive(:length)
			cell.receive(ship)
		end 

		it "should raise an error if cell reach ship length" do
			expect(ship).to receive(:length).and_return(3)
			expect{ 4.times{cell.receive(ship)} }.to raise_error(RuntimeError)
		end

		xit "should receive the coordinates to place the ship" do
			expect(board).to receive(:placement)
		end

	end

	context 'During the Game' do
		
		it 'should be able to take a hit' do
			expect(cell).to respond_to(:hit_it!)
		end

		it "should return 'miss' if the content is water" do
			cell.hit_it!
			expect(cell.status).to eq 'miss'
		end

		it "should return 'hit' if the content is a ship" do
			expect(ship).to receive(:hit!)
			cell.content = ship
			cell.hit_it!
			expect(cell.status).to eq 'hit'
		end
	end
end