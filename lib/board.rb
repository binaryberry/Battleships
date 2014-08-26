class Board

	def cells
	@cells = []
	v=0
		("A".."J").each do |letter|
			(1..10).each do |number|
			k="#{letter}#{number}"
			
			@cells[v]=k
			v+=1
			end
		end
	@cells
	end

end

# class Ship
# def initialize
# @hits_left = 5
# end
# def hit!
# @hits_left -= 1
# "boom"
# end
# end