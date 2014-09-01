require './lib/grid'
require './lib/cell'
require './lib/player.rb'
require './lib/score.rb'

class Game

	attr_reader 	:player_1, :player_2, :score
	attr_accessor	:turn

	def initialize(player1, player2)
	@player_1 = Player.new(player1)
	@player_1.id = "player_1"
	@player_2 = Player.new(player2)
	@player_2.id = "player_2"
	@turn = player_1
	@score = Score.new
	end

	def opponent
		self.turn == player_1 ?  player_2 : player_1 
	end


	def place(ship, on_behalf_of, on_cell, facing)
		on_behalf_of.grid.place(on_behalf_of.ships[ship],on_cell.to_s.upcase, facing.to_s.downcase)
	end 

	def shoot(coordinates)
		score.check(opponent) if opponent.grid.hit(coordinates)
		return "#{turn.name} has won the game!"	if score.winner?(turn)
		switch_turn
	end

	def switch_turn
		self.turn == player_1 ? @turn = player_2 : @turn = player_1 	
	end

	def opponent_board
		duplicate = opponent.grid.dup
		duplicate.cells.values.each {|cell| cell.content = nil}
	end


end 