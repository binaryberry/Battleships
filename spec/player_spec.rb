require "player"
require "grid"

describe Player do
  
let(:player) 	{Player.new("Rihanna")}
let(:grid) 		{Grid.new("Rihanna")}

	it "is created with a name" do
		expect(player.name).to eq "Rihanna"
	end

	it "it is created with a grid" do
		expect(player.grid).to be_a(Grid)
	end

	it "creates 5 ships per player when initialized" do
		expect(player.ships.count).to eq 5
	end

	it "can be given an id" do
	player.id = "player_1"
	expect(player.id).to eq "player_1"
	end



end