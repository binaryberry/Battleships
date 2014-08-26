class Cell

	attr_accessor :status, :content

	def initialize
		@status = nil
	end

	def hit!
		@status = 'hit'
	end


end