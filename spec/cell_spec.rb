require "cell"

describe Cell do

	let(:cell)  { Cell.new('A1') }
	let(:ship)  { double :ship   }
	let(:grid) { double :grid  }


	context 'Is initialized' do
		
		it "with an empty status" do
			expect(cell.status).to eq nil
		end

		it 'with water as contents' do
			expect(cell.content).to eq 'water'
		end

		it 'knowing its coordinates' do
			expect(cell.coordinates).to match(/[A-J]\d/)
		end
	end

	context 'Interacting with the ship' do
		
		it "should change its content to ship when receives a ship" do
			allow(ship).to receive(:place!).and_return(true)
			cell.accept(ship)
			expect(cell.content).to eq ship
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