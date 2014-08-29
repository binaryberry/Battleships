require "./lib/ship"
require "./lib/git brplayer"


class Score

	def red_alert(ship)
		ship.sunk?(self)
	end

	def number_of_ships_left?(player)
		player.ships.pop 
	end

end