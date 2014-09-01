
require "./lib/ship"
require "./lib/player"
require './lib/game'


class Score

	NUMBER_OF_SHIPS = 5

	attr_accessor :counter_player2,:counter_player1

	def initialize
		@counter_player2 = 0
		@counter_player1 = 0
	end

	def red_alert(ship)
		ship.sunk?
	end

	def check(player)
		@counter_player2 += 1 if player.id == "player_2"
		@counter_player1 += 1 if player.id == "player_1"
	end

	def winner?(player)
		return @counter_player2 == NUMBER_OF_SHIPS if player.id == "player_1"
		return @counter_player1 == NUMBER_OF_SHIPS if player.id == "player_2"
	end

end
