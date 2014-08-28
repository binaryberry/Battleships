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


end