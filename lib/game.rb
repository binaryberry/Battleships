require './lib/board'

class Game

	attr_reader :player1, :player2, :board1, :board2

	def initialize
	@player1 = Player.new
	@player2 = Player.new
	@board1 = Board.new(player1)
	@board2 = Board.new(player2)
	end

	def ask_placement(board)
		board.ships.each do |ship|
			length = ship.length
			@placement = []
			while length > 0 do
				puts "please input placement cell for #{ship}, ie:B11"
				coordinates = gets.chomp.capitalize
				@placement << coordinates
				length-=1
			end
		end
		@placement
	end
end 